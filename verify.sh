#!/bin/bash
printf '✨✨ Welcome! Here are the installed versions of your favorite tools ✨✨\n\n'

printf "🔧 \e[0mGit Version: \e[1;32m$(git --version)\e[0m \n\n"

printf "🟢 Node Version: \e[1;32m$(node --version)\e[0m \n\n"

printf "📦 Npm Version: \e[1;32m$(npm --version)\e[0m \n\n"

printf "🍞 Bun Version: \e[1;32m$(bun --version)\e[0m \n\n"

printf "🐍 Python Version: \e[1;32m$(python3 --version)\e[0m \n\n"

printf "🛠️ GCC Version: \e[1;32m$(gcc --version | head -n 1)\e[0m \n"