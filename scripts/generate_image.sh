#!/usr/bin/env bash
# Generate an image via the BFL (Flux) API.
# Usage: generate_image.sh <prompt-file> <output.png> [width] [height]
# Env: BFL_API_KEY must be set (sourced from publishing/production/.env).
set -euo pipefail

prompt_file="$1"
output="$2"
width="${3:-1024}"
height="${4:-1024}"

prompt=$(cat "$prompt_file")

# Submit job
submit=$(curl -sS -X POST 'https://api.bfl.ai/v1/flux-pro-1.1' \
  -H 'accept: application/json' \
  -H "x-key: ${BFL_API_KEY}" \
  -H 'Content-Type: application/json' \
  -d "$(jq -n --arg p "$prompt" --argjson w "$width" --argjson h "$height" \
    '{prompt: $p, width: $w, height: $h, prompt_upsampling: true, safety_tolerance: 2}')")

id=$(echo "$submit" | jq -r '.id // empty')
polling_url=$(echo "$submit" | jq -r '.polling_url // empty')
if [ -z "$id" ]; then
  echo "submit failed: $submit" >&2
  exit 1
fi
echo "submitted $output: id=$id"

# Poll until ready
for i in $(seq 1 60); do
  sleep 2
  if [ -n "$polling_url" ]; then
    res=$(curl -sS "$polling_url" -H "x-key: ${BFL_API_KEY}")
  else
    res=$(curl -sS "https://api.bfl.ai/v1/get_result?id=$id" -H "x-key: ${BFL_API_KEY}")
  fi
  status=$(echo "$res" | jq -r '.status // empty')
  case "$status" in
    Ready)
      sample_url=$(echo "$res" | jq -r '.result.sample')
      echo "ready: $output"
      curl -sS "$sample_url" -o "$output"
      exit 0
      ;;
    Pending|Queued|Request\ Moderated|Content\ Moderated)
      printf '.'
      ;;
    *)
      echo "unexpected status '$status': $res" >&2
      exit 1
      ;;
  esac
done

echo "timeout waiting for $output" >&2
exit 1
