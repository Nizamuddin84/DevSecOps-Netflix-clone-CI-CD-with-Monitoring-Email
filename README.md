<div align="center">
  <a href="http://netflix-clone-with-tmdb-using-react-mui.vercel.app/">
    <img src="./public/assets/netflix-logo.png" alt="Logo" width="100" height="32">
  </a>

  <h3 align="center">Netflix Clone</h3>

  <p align="center">
    <a href="https://netflix-clone-react-typescript.vercel.app/">View Demo</a>
    ·
    <a href="https://github.com/crazy-man22/netflix-clone-react-typescript/issues">Report Bug</a>
    ·
    <a href="https://github.com/crazy-man22/netflix-clone-react-typescript/issues">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#prerequests">Prerequests</a>
    </li>
    <li>
      <a href="#which-features-this-project-deals-with">Which features this project deals with</a>
    </li>
    <li><a href="#third-party-libraries-used-except-for-react-and-rtk">Third Party libraries used except for React and RTK</a></li>
    <li>
      <a href="#contact">Contact</a>
    </li>
  </ol>
</details>

<br />

<div align="center">
  <img src="./public/assets/home-page.png" alt="Logo" width="100%" height="100%">
  <p align="center">Home Page</p>
  <img src="./public/assets/mini-portal.png" alt="Logo" width="100%" height="100%">
  <p align="center">Mini Portal</p>
  <img src="./public/assets/detail-modal.png" alt="Logo" width="100%" height="100%">
  <p align="center">Detail Modal</p>
  <img src="./public/assets/grid-genre.png" alt="Logo" width="100%" height="100%">
  <p align="center">Grid Genre Page</p>
  <img src="./public/assets/watch.png" alt="Logo" width="100%" height="100%">
  <p align="center">Watch Page with customer contol bar</p>
</div>

## Prerequests

- Create an account if you don't have on [TMDB](https://www.themoviedb.org/).
  Because I use its free API to consume movie/tv data.
- And then follow the [documentation](https://developers.themoviedb.org/3/getting-started/introduction) to create API Key
- Finally, if you use v3 of TMDB API, create a file named `.env`, and copy and paste the content of `.env.example`.
  And then paste the API Key you just created.

## Which features this project deal with

- How to create and use [Custom Hooks](https://reactjs.org/docs/hooks-custom.html)
- How to use [Context](https://reactjs.org/docs/context.html) and its provider
- How to use lazy and Suspense for [Code-Splitting](https://reactjs.org/docs/code-splitting.html)
- How to use a new [lazy](https://reactrouter.com/en/main/route/lazy) feature of react-router to reduce bundle size.
- How to use data [loader](https://reactrouter.com/en/main/route/loader) of react-router, and how to use redux dispatch in the loader to fetch data before rendering component.
- How to use [Portal](https://reactjs.org/docs/portals.html)
- How to use [Fowarding Refs](https://reactjs.org/docs/forwarding-refs.html) to make components reusuable
- How to create and use [HOC](https://reactjs.org/docs/higher-order-components.html)
- How to customize default theme of [MUI](https://mui.com/)
- How to use [RTK](https://redux-toolkit.js.org/introduction/getting-started)
- How to use [RTK Query](https://redux-toolkit.js.org/rtk-query/overview)
- How to customize default classname of [MUI](https://mui.com/material-ui/experimental-api/classname-generator)
- Infinite Scrolling(using [Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API))
- How to make awesome carousel using [slick-carousel](https://react-slick.neostack.com)

## Third Party libraries used except for React and RTK

- [react-router-dom@v6.9](https://reactrouter.com/en/main)
- [MUI(Material UI)](https://mui.com/)
- [framer-motion](https://www.framer.com/docs/)
- [video.js](https://videojs.com)
- [react-slick](https://react-slick.neostack.com/)

## Install with Docker

```sh
docker build --build-arg OMDB_API_KEY=your_api_key_here -t netflix-clone .

docker run --name netflix-clone-website --rm -d -p 80:80 netflix-clone
```

## Todo

- Make the animation of video card portal more similar to Netflix.
- Improve performance. I am using `context` and `provider` but all components subscribed to the context's value are re-rendered. These re-renders happen even if the part of the value is not used in render of the component. there are [several ways](https://blog.axlight.com/posts/4-options-to-prevent-extra-rerenders-with-react-context/) to prevent the re-renders from these behaviours. In addition to them, there may be several performance issues.
- Replace bundler([Vite](https://vitejs.dev/guide)) with [Turbopack](https://turbo.build/pack/docs/why-turbopack). Turbopack is introduced in Next.js conf recently. It's very fast but it's nor ready to use right now. it just support Next.js, and they plan to support all others as soon as possible. so if it's ready to use, replace [Vite](https://vitejs.dev/guide) with [Turbopack](https://turbo.build/pack/docs/why-turbopack).
- Add accessibilities for better UX.
- Add Tests.
📊 Monitoring & Observability

This project integrates Prometheus, Node Exporter, and Grafana to monitor infrastructure and application performance.

Monitoring Tools

- Prometheus: Collects and stores time-series metrics.
- Node Exporter: Exposes Linux system metrics such as CPU, memory, disk, and network usage.
- Grafana: Visualizes infrastructure metrics through interactive dashboards.
- Jenkins Monitoring: Tracks Jenkins performance and health metrics.

Monitoring Configuration

The "monitoring/" directory contains:

- "prometheus.yml.example" – Prometheus scrape configuration.
- "node-exporter-dashboard.json" – Exported Grafana dashboard for Linux system monitoring.

Key Metrics

- CPU utilization
- Memory usage
- Disk utilization
- Network traffic
- Jenkins health and performance

Monitoring Architecture

Prometheus → Node Exporter / Jenkins → Grafana Dashboards

⚙️ CI/CD Pipeline

The project uses Jenkins to automate the application build, security analysis, Docker image creation, and deployment.

Pipeline Stages

1. Clean Workspace: Removes previous build files.
2. Git Checkout: Retrieves source code from GitHub.
3. SonarQube Analysis: Performs static code quality analysis.
4. Quality Gate: Checks the SonarQube quality gate.
5. Dependency Installation: Installs application dependencies using npm.
6. OWASP Dependency Check: Scans project dependencies for known vulnerabilities.
7. Trivy Filesystem Scan: Scans the project filesystem.
8. Docker Build & Push: Builds the Docker image and pushes it to Docker Hub.
9. Trivy Image Scan: Scans the Docker image for vulnerabilities.
10. Kubernetes Deployment: Deploys the application using Kubernetes deployment and service manifests.
11. Email Notification: Sends pipeline build notifications.

Technologies Used

- Jenkins
- Git & GitHub
- Docker & Docker Hub
- SonarQube
- OWASP Dependency-Check
- Trivy
- Kubernetes
- Prometheus
- Grafana
- AWS EC2

AWS Infrastructure Architecture

This project uses four AWS EC2 instances to manage CI/CD automation, monitoring, and Kubernetes deployment.

Infrastructure Components

EC2 Instance| Installed Tools| Purpose
EC2 1 – CI/CD Server| Jenkins, Docker, SonarQube| Build, code analysis, security scanning, and deployment automation
EC2 2 – Monitoring Server| Prometheus, Grafana| Infrastructure monitoring and visualization
EC2 3 – Kubernetes Master| Kubernetes Control Plane| Manages the Kubernetes cluster
EC2 4 – Kubernetes Worker| Kubernetes Worker Node| Runs the Netflix Clone application pods

Total: 4 AWS EC2 instances.

Deployment Workflow

1. Developer pushes application code to GitHub.
2. Jenkins fetches the source code.
3. SonarQube performs code quality analysis.
4. Docker builds the application image.
5. Security scanning tools check the application and image.
6. The Docker image is pushed to Docker Hub.
7. Jenkins deploys the application to the Kubernetes cluster.
8. Prometheus collects monitoring metrics.
9. Grafana displays monitoring dashboards.

Prerequisites

Before setting up this project, make sure you have the following:

AWS Infrastructure

- AWS account
- EC2 instances running Ubuntu Linux
- Security Groups configured for required application and monitoring ports
- SSH access to EC2 instances

DevOps Tools

- Git and GitHub
- Jenkins
- Docker
- SonarQube
- Trivy for security scanning
- Kubernetes
- kubectl
- Prometheus
- Grafana
- Node Exporter

Application Requirements

- Node.js
- npm
- Docker Hub account

Basic Knowledge

- Linux commands
- Git and GitHub
- CI/CD pipeline concepts
- Docker and containerization
- Kubernetes deployment and services
- Monitoring and observability
