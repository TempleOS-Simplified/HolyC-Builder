
<h1 align="center">
<a href="https://www.youtube.com/watch?v=kr7jU_3RI4ke"><img src="logo.png" alt="The Temple Operating System" width="150"></a>

<p align="center">🙏 HolyC Builder 🏗️</p>
</h1>

<div align="center">
    <a href="https://discord.gg/Epu3WxjaP7"><img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord Invite"></a> <a href="https://templeos.me"><img src="https://img.shields.io/badge/website-000000?style=for-the-badge&logo=About.me&logoColor=white" alt="Website"></a>
    <p1><i><br>Import code inside TempleOS.</i></p1>
</div>
<hr>

## About
HolyC Builder allows you to write and package HolyC code outside of TempleOS as well as building it in TempleOS!

HolyC Builder is built in shell which means it works across *all* UNIX based Operating Systems. HolyC Builder relies on the software "RedSeaGen" created by [Slendi](https://git.checksum.fail/slendi/WordleTOS) which generates ISO.C files.

For Windows, instead use [RedSeaExplorer](https://git.checksum.fail/doodguy/RedSeaExplorer/src/branch/main) by doodguy which allows both importing and exporting files from TempleOS.

## Prerequisites
* Bash
* QEMU
* Git (Optional)

## Installation
1. Clone the repository (or download the ZIP):
    ```sh
    $ git clone https://github.com/TempleOS-Simplified/HolyC-Builder.git && cd HolyC-Builder
2. Running the install script. WIll require sudo password.
    ```sh
    $ sh install.sh
    ```
## Usage

1. Create a blank directory to get started, you can name this after a project or just a generic name like HolyC, and inside this directory create a directory called "src". This folder doesn't have to be called src but it must exist.
    ```sh
    $ mkdir -p ~/HolyC/src
    $ cd ~/HolyC
    ```
2. You can practically place anything in this newely created `src` folder but for the purpose of continuing this example, we will write an example HolyC file to this directory at `~/HolyC/src/example.HC`

    ```holyc
    U0 Main(){
        "Hello, GitHub\n";
    } 
    Main()
    ```
3. Next, run the following command whilst inside `~/HolyC`:
    ```sh
    holyc --build src output.iso.c
    ```
    This created a TempleOS ISO.C file similar to those of supplementals. You can now mount this in VMWare or QEMU; in fact, HolyC Builder is able to automate this with `--run`.

## Video
For a more indepth explanation, check out my video which explores more features.
<iframe width="1280" height="720" src="https://www.youtube.com/embed/kr7jU_3RI4k" title="Writing HolyC code outside TempleOS ... And importing it." frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>