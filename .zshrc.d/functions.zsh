# mkdir + cd
function mkcd {
  mkdir -p $@ && cd ${@:$#} && pwd
}

# mv + cd
function mvcd {
  mv $1 $2 && cd "$_"  && pwd
}

# print (first) column
function pcol {
  awk "{print(\$${1:-1})}"
}

# make note
function mknt {
  nvim $(date +%F)--${1}.md;
}

# list colors
function clrs {
  echo "|  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |"
  for x in 3 4 9 10; do
    printf "|%-2s" $x
    for y in {0..7}; do
      printf "|\e[${x}${y}m[#]\e[0m";
    done; echo "|"
  done
}

# change terminal title to user@host
function precmd {
  echo -en "\e]2;${USERNAME}@${HOSTNAME%%.*}\a"
}
