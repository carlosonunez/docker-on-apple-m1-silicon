# docker-m1-hack

Run Docker on your ultra-fast M1-powered Mac until Docker releases a more official solution.

## How to use

**NOTE**: This should work on `arm` or `x86` shells.

1. Clone this repo: `git clone https://github.com/carlosonunez/docker-m1-helper`
2. Download Ansible: `brew install ansible`
3. Run this playbook: `cd docker-m1-helper && ansible-playbook site.yml`
4. Confirm that everything is working: `docker run hello-world`

## Caveats

- This downloads a 2GB Ubuntu Live CD. Once that download is finished, this playbook takes
  about two minutes to complete.
- You'll only be able to run `arm64` Docker images, as cross-platform virtualization is not
  supported yet.

## Credits

- Thanks, Sven! Original post [here](https://finestructure.co/blog/2020/11/27/running-docker-on-apple-silicon-m1)
