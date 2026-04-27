---
title: Learn
nav_order: 5
---


Curated index of free + open educational material covering the
ground OpenLoco builds on: dynamics, control, planning, perception,
RL, simulators, actuators, and open-hardware reference designs.

Inclusion criteria: fully free (open-access textbook, open license,
free PDF, public lecture series), or canonical reference whose
documentation is free even if the underlying tool is proprietary.
Paywalled books like *Probabilistic Robotics* (Thrun et al.),
*Robotics: Modelling Planning Control* (Siciliano), and *Principles
of Robot Motion* (Choset et al.) are excluded.

PRs welcome to extend.

## Foundational textbooks (theory + control + planning)

- **[Underactuated Robotics](https://underactuated.mit.edu/)** — Russ Tedrake's interactive MIT textbook on dynamics and control of underactuated systems. Free online (CC, code BSD).
- **[Robotic Manipulation](https://manipulation.mit.edu/)** — Tedrake's interactive textbook on perception, planning, control for manipulation. Free online (CC, code BSD).
- **[Planning Algorithms](https://lavalle.pl/planning/)** — Steven LaValle's comprehensive planning textbook (configuration space, sampling-based, decision-theoretic). Free PDF, full book.
- **[Reinforcement Learning: An Introduction (2nd ed.)](http://incompleteideas.net/book/RLbook2020.pdf)** — Sutton & Barto canonical RL textbook. Free PDF (author posted).
- **[Deep Learning Book](https://www.deeplearningbook.org/)** — Goodfellow, Bengio, Courville. Free online HTML.
- **[Modern Robotics: Mechanics, Planning, and Control](https://hades.mech.northwestern.edu/index.php/Modern_Robotics)** — Lynch & Park (Northwestern) free wiki + lecture videos. Book paywalled, code MIT-licensed at [NxRLab/ModernRobotics](https://github.com/NxRLab/ModernRobotics).
- **[Probabilistic Machine Learning, Vol. 1](https://probml.github.io/pml-book/book1.html) and [Vol. 2](https://probml.github.io/pml-book/book2.html)** — Kevin Murphy. Free PDF drafts.
- **[Data-Driven Science and Engineering](https://databookuw.com/)** — Brunton & Kutz (UW) on dynamical systems, control, ML. Free PDF.

## University courses with public materials

- **[MIT 6.832 Underactuated Robotics (OCW 2009)](https://ocw.mit.edu/courses/6-832-underactuated-robotics-spring-2009/)** — Tedrake's lecture notes, problem sets, videos. CC-BY-NC-SA.
- **[MIT 6.4210 Robotic Manipulation (OCW Fall 2022)](https://ocw.mit.edu/courses/6-4210-robotic-manipulation-fall-2022/)** — Tedrake's manipulation course, with notebooks. CC-BY-NC-SA.
- **[Underactuated Robotics lecture playlist](https://www.youtube.com/playlist?list=PLkx8KyIQkMfWr191lqbN8WfV08lf3oTOe)** — Tedrake YouTube lectures. Free.
- **[Stanford CS223A — Introduction to Robotics](https://see.stanford.edu/Course/CS223A)** — Khatib's course on kinematics, dynamics, control.
- **[Berkeley CS287 — Advanced Robotics](https://people.eecs.berkeley.edu/~pabbeel/cs287-fa19/)** — Pieter Abbeel; lectures, notes.
- **[CMU Motion Planning (16-735)](https://www.cs.cmu.edu/~motionplanning/)** — Choset et al. course site with full lecture slides.
- **[ETH Robot Dynamics](https://rsl.ethz.ch/education-students/lectures/robotdynamics.html)** — Hutter / Siegwart RSL course; [PDF script](https://ethz.ch/content/dam/ethz/special-interest/mavt/robotics-n-intelligent-systems/rsl-dam/documents/RobotDynamics2017/RD_HS2017script.pdf), ~400 pages.
- **[MIT 6.S191 — Intro to Deep Learning](https://introtodeeplearning.com/)** — open course, video + slides.
- **[Stanford CS231n — CNNs for Visual Recognition](https://cs231n.github.io/)** — canonical CV course notes.
- **[MIT 6.5940 — TinyML and Efficient Deep Learning](https://efficientml.ai/)** — Han Lab; quantization, pruning, distillation.
- **[F1TENTH Course Kit](https://f1tenth-coursekit.readthedocs.io/en/latest/)** — autonomous racing curriculum (MIT/UPenn). CC-BY.
- **[Duckietown documentation/courses](https://docs.duckietown.org/daffy/)** — open self-driving educational platform.

## Reinforcement learning / learning-based control

- **[Spinning Up in Deep RL](https://spinningup.openai.com/en/latest/)** — OpenAI's pedagogical RL intro with code. MIT.
- **[Berkeley CS285 — Deep RL (Sergey Levine)](https://rail.eecs.berkeley.edu/deeprlcourse/)** — full lectures, slides, homework. [Lecture playlist](https://www.youtube.com/playlist?list=PLkFD6_40KJIwhWJpGazJ9VSj9CFMkb79A).
- **[Deep RL Bootcamp (Berkeley 2017)](https://sites.google.com/view/deep-rl-bootcamp/lectures)** — Abbeel et al. lectures.
- **[Hugging Face Deep RL Course](https://huggingface.co/learn/deep-rl-course/unit0/introduction)** — practical RL with stable-baselines3 and CleanRL.
- **[Gymnasium](https://gymnasium.farama.org/)** — Farama Foundation's maintained fork of OpenAI Gym; standard RL environment API. MIT.
- **[Stable-Baselines3](https://github.com/DLR-RM/stable-baselines3)** — reliable PyTorch RL algorithm implementations. MIT.
- **[PettingZoo](https://github.com/Farama-Foundation/PettingZoo)** — multi-agent RL environment standard. MIT.
- **[Minari](https://github.com/Farama-Foundation/Minari)** — offline RL dataset standard (Farama). MIT.
- **[rsl_rl](https://github.com/leggedrobotics/rsl_rl)** — fast PPO implementation tuned for legged-robot training. BSD-3.
- **[legged_gym](https://github.com/leggedrobotics/legged_gym)** — Isaac Gym training pipeline for ANYmal, Cassie, etc. BSD-3.
- **[walk-these-ways](https://github.com/Improbable-AI/walk-these-ways)** — MIT learning-based locomotion controller, full training code. MIT.
- **[gym-pybullet-drones](https://github.com/utiasDSL/gym-pybullet-drones)** — quadrotor RL environments (UTIAS DSL). MIT.

## Simulators with open documentation

- **[MuJoCo](https://github.com/google-deepmind/mujoco)** — DeepMind physics engine for robotics/RL, now open source. Apache 2.0. [User manual](https://mujoco.readthedocs.io/en/stable/overview.html).
- **[MJX](https://github.com/google-deepmind/mujoco/tree/main/mjx)** — JAX/GPU port of MuJoCo for massively parallel RL. Apache 2.0.
- **[MuJoCo Menagerie](https://github.com/google-deepmind/mujoco_menagerie)** — high-quality URDF/MJCF assets for many robots (Spot, ANYmal, Franka, etc.). Apache 2.0.
- **[MuJoCo Playground](https://github.com/google-deepmind/mujoco_playground)** — DeepMind RL training environments on MJX. Apache 2.0.
- **[dm_control](https://github.com/google-deepmind/dm_control)** — DeepMind Control Suite + MJCF Python bindings. Apache 2.0.
- **[Drake](https://drake.mit.edu/)** — Tedrake / MIT model-based design and verification toolbox. BSD-3. [Source](https://github.com/RobotLocomotion/drake), [C++ API](https://drake.mit.edu/doxygen_cxx/index.html).
- **[Brax](https://github.com/google/brax)** — Google JAX-native rigid-body physics for accelerated RL. Apache 2.0.
- **[Genesis](https://genesis-embodied-ai.github.io/)** — multi-physics differentiable simulator (CMU/Tsinghua/MIT). Apache 2.0.
- **[Habitat](https://aihabitat.org/)** — Meta AI 3D simulator for embodied agents. MIT.
- **[Isaac Lab](https://isaac-sim.github.io/IsaacLab/main/index.html)** — NVIDIA's GPU-accelerated robot learning framework on Isaac Sim. BSD-3.
- **[Isaac Sim docs](https://docs.isaacsim.omniverse.nvidia.com/)** — NVIDIA full Omniverse robotics simulator docs. Free use, proprietary engine.
- **[Gazebo](https://gazebosim.org/)** — successor to classic Gazebo, used with ROS 2. Apache 2.0. [Docs (Harmonic)](https://gazebosim.org/docs/harmonic). [Classic Gazebo](https://classic.gazebosim.org/).
- **[Bullet / PyBullet](https://github.com/bulletphysics/bullet3)** — Coumans' physics engine widely used in RL benchmarks. zlib.
- **[ARGoS](https://www.argos-sim.info/)** — multi-robot swarm simulator (IRIDIA Brussels). MIT.
- **[SimBenchmark](https://leggedrobotics.github.io/SimBenchmark/)** — comparison suite for MuJoCo/Bullet/ODE/RaiSim accuracy.

## Actuator + motor hardware references

- **[mjbots Moteus](https://github.com/mjbots/moteus)** — open brushless servo controller; full hardware/firmware/protocol. Apache 2.0. [Reference manual](https://github.com/mjbots/moteus/blob/main/docs/reference.md).
- **[SimpleFOC](https://docs.simplefoc.com/)** — Arduino-grade FOC library + extensive theory docs. MIT.
- **[ODrive Robotics](https://docs.odriverobotics.com/)** — high-performance BLDC controller with deep tuning docs. MIT (firmware).
- **[ODRI Open Robot Actuator Hardware](https://github.com/open-dynamic-robot-initiative/open_robot_actuator_hardware)** — full open-source quasi-direct-drive actuator (motor + driver + transmission). BSD-3.
- **[Trinamic / Analog Devices](https://analog.com/trinamic)** — motor driver landing page (datasheets/app notes free).
- **[Robotis Dynamixel e-Manual](https://emanual.robotis.com/docs/en/dxl/)** — protocol docs, control table, tutorials.
- **[Maxon Academy](https://www.maxongroup.com/maxon/view/content/maxon-academy-training)** — free training pages on DC/BLDC motor sizing.
- **[T-Motor](https://www.tmotor.com/)** — drone/legged motor specs and datasheets.
- **[Field-Oriented Control (Wikipedia)](https://en.wikipedia.org/wiki/Field-oriented_control)** — theory primer with citations. CC-BY-SA.

## Open hardware reference designs (robots)

- **[Stanford Pupper / StanfordQuadruped](https://github.com/stanfordroboticsclub/StanfordQuadruped)** — open quadruped reference (Stanford Robotics Club). MIT.
- **[ODRI Solo](https://github.com/open-dynamic-robot-initiative/open_robot_actuator_hardware)** — Open Dynamic Robot Initiative quadruped (MPI / NYU / MPI-IS). BSD-3.
- **[MIT Mini Cheetah / Cheetah-Software](https://github.com/mit-biomimetics/Cheetah-Software)** — original Cheetah-3 / mini-cheetah codebase. MIT.
- **[CHAMP](https://github.com/chvmp/champ)** — quadruped controller framework supporting Mini Cheetah and others. BSD-3.
- **[ANYmal C URDF](https://github.com/ANYbotics/anymal_c_simple_description)** — ANYbotics-released ANYmal C model. BSD-3.
- **[Spot in MuJoCo Menagerie](https://github.com/google-deepmind/mujoco_menagerie/tree/main/boston_dynamics_spot)** — Boston Dynamics Spot model. Apache 2.0 (model files).
- **[Upkie](https://github.com/upkie/upkie)** — open-source wheeled-biped (Stéphane Caron). Apache 2.0.
- **[LeRobot](https://github.com/huggingface/lerobot)** — Hugging Face end-to-end robot learning stack with hardware integrations. Apache 2.0.
- **[Bitcraze Crazyflie firmware](https://github.com/bitcraze/crazyflie-firmware)** — open nano-quadrotor flight stack. GPL-3.
- **[Trossen Interbotix](https://github.com/Interbotix/interbotix_ros_manipulators)** — ROS packages for Interbotix arms (ViperX, etc.). BSD-3.
- **[Pollen Reachy 2 SDK](https://github.com/pollen-robotics/reachy2-sdk)** — open SDK for the Reachy 2 humanoid arm/torso. Apache 2.0.

## ROS / middleware / tooling

- **[ROS 2 documentation (Humble)](https://docs.ros.org/en/humble/index.html)** — official current LTS docs. CC-BY.
- **[MoveIt 2](https://moveit.picknik.ai/main/index.html)** — motion planning framework for ROS 2 manipulators. BSD-3.
- **[Nav2](https://docs.nav2.org/)** — ROS 2 navigation stack documentation. Apache 2.0.
- **[urdf_tutorial](https://github.com/ros/urdf_tutorial)** — official ROS URDF tutorial repo. BSD.
- **[URDF XML spec](https://wiki.ros.org/urdf/XML)** — formal URDF tag reference. CC-BY.
- **[robot_localization](https://github.com/cra-ros-pkg/robot_localization)** — EKF/UKF state estimation package for ROS. BSD.

## Probabilistic / state estimation / SLAM

- **[Cyrill Stachniss YouTube](https://www.youtube.com/c/CyrillStachniss)** — Bonn professor's full SLAM/photogrammetry/robotics lecture series. [SLAM playlist](https://www.youtube.com/playlist?list=PLgnQpQtFTOGQrZ4O5QzbIHgl3b1JHimN_).
- **[IPB Bonn teaching page](https://www.ipb.uni-bonn.de/teaching/)** — Stachniss group lecture materials and slides.
- **[UZH Robotics & Perception Group teaching](https://rpg.ifi.uzh.ch/teaching.html)** — Scaramuzza's VO/VIO/SLAM courses (slides + videos).
- **[ORB-SLAM3](https://github.com/UZ-SLAMLab/ORB_SLAM3)** — state-of-the-art open visual-inertial SLAM. GPL-3.
- **[Google Cartographer](https://github.com/cartographer-project/cartographer)** — real-time 2D/3D LIDAR SLAM. Apache 2.0. [Docs](https://google-cartographer.readthedocs.io/en/latest/).
- **[Kimera-VIO](https://github.com/MIT-SPARK/Kimera-VIO)** — MIT-SPARK visual-inertial odometry with loop closure. BSD-2. [Full Kimera stack](https://github.com/MIT-SPARK/Kimera).
- **[A-LOAM](https://github.com/HKUST-Aerial-Robotics/A-LOAM)** — advanced implementation of LOAM LIDAR odometry (HKUST). BSD.
- **[OpenSLAM](https://openslam-org.github.io/)** — historical archive of canonical SLAM algorithm implementations (gmapping, GraphSLAM, etc.).

## Algorithm libraries + canonical reference implementations

- **[PythonRobotics](https://github.com/AtsushiSakai/PythonRobotics)** — Atsushi Sakai's huge collection of clean Python implementations of canonical robotics algorithms. MIT. [Algorithm explanations](https://atsushisakai.github.io/PythonRobotics/).
- **[Peter Corke Robotics Toolbox (Python)](https://github.com/petercorke/robotics-toolbox-python)** — kinematics/dynamics/trajectory toolkit. MIT.
- **[spatialmath-python](https://github.com/petercorke/spatialmath-python)** — SE(3) / SO(3) math companion library. MIT.
- **[mpc.pytorch](https://github.com/locuslab/mpc.pytorch)** — differentiable MPC reference implementation (Kolter lab). MIT.

## Lecture series

- **[Steve Brunton (UW)](https://www.youtube.com/c/Eigensteve)** — control theory, Koopman, SINDy. [Control bootcamp playlist](https://www.youtube.com/playlist?list=PLMrJAkhIeNNR3sNYvfgiKgcStwuPSts9V).
