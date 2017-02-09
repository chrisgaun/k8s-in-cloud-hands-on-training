# Prerequisities for Windows users

## Terraform

Open a Powershell window **as Administrator** and execute the following commands:

```
$ Set-ExecutionPolicy unrestricted
$ iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
$ choco install terraform -y
$ choco install git.install -y
```

## A Digital Ocean account

You will also require an account on [https://www.digitalocean.com/](https://www.digitalocean.com/)