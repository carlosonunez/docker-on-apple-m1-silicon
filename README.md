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

## Dealing with volumes

Because this method connects your Docker client to a remote Docker engine, you won't be able
to mount volumes like you normally did with Docker for Mac. Instead, you'll have to `rsync`
your files between your computer and the VM running Docker.

Here's how you can do that:

1. Create the directory in your Docker VM and `rsync`:

   ```sh
   ssh ubuntu@$ip_address "sudo mkdir -p '$PWD' && sudo chown -R ubuntu '$PWD'"
   rsync -avh --progress $PWD/* ubuntu@$ip_address:$PWD
   ```

2. Make your changes and run your Docker commands/Docker Compose services.
3. `rsync` those changes back:

   ```sh
   rsync -avh --progress --update ubuntu@$ip_address/ $PWD
   ```


## Credits

- Thanks, Sven! Original post [here](https://finestructure.co/blog/2020/11/27/running-docker-on-apple-silicon-m1)
