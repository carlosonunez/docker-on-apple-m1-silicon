# docker-on-apple-m1-silicon

## ⚠️ ⚠️ ⚠️  Deprecation Notice ⚠️ ⚠️ ⚠️  

Docker did it! They've released a beta version of Docker for Mac. It supports
ARM and (with a performance penalty) x86-64 images. Please use that instead!

Learn more [here](https://www.docker.com/blog/download-and-try-the-tech-preview-of-docker-desktop-for-m1/).

---

Run Docker on your ultra-fast M1-powered Mac until Docker releases a more official solution.

## How to use

**NOTE**: This should work on `arm` or `x86` shells.

1. Clone this repo: `git clone https://github.com/carlosonunez/docker-on-apple-m1-silicon`
2. Download Ansible: `brew install ansible`
3. Run this playbook: `cd docker-m1-helper && ansible-playbook site.yml`
4. Confirm that everything is working: `docker run hello-world`

## What does this do?

This playbook will:

- Create an ARM-based VM using Apple's Virtualization Framework built into Big Sur (via `vftool`),
- Provisions a 4GB image for Docker metadata and an 8GB image for your workspace
  (which will be mounted at /Users/$USER so that you don't have to change your existing
  scripts or Docker Compose files), and
- Installs Docker onto the VM and creates a context for your client to find it

## Troubleshooting

- It can take a few minutes for the data images to provision themselves. This only happens
the first time you run this playbook.
- If the VM shuts down (from sleep or a restart), just run this playbook again to re-provision it. It takes 30-60 seconds to
complete with a good network connection.
- If you need to start fresh, `sudo rm ~/.docker_m1` and run this playbook again.
- If you need to enter the VM for debugging, you can:
    - SSH into it: `ssh ubuntu@$ip_address`, or
    - `screen` into it: `sudo screen -r docker`

## Caveats

- This downloads a 2GB Ubuntu Live CD. Once that download is finished, this playbook takes
  about two minutes to complete.
- You'll only be able to run `arm64` Docker images, as cross-platform virtualization is not
  supported yet.

## Dealing with volumes

Because this method connects your Docker client to a remote Docker engine, you won't be able
to mount volumes like you normally did with Docker for Mac. Instead, you'll have to `rsync`
your files between your computer and the VM running Docker.

Consider aliasing `docker` and `docker-compose` to `docker_hack.sh` and `docker_compose_hack.sh`
(included here) which can handle this transparently for you.

## Credits

- Thanks, Sven! Original post [here](https://finestructure.co/blog/2020/11/27/running-docker-on-apple-silicon-m1)
