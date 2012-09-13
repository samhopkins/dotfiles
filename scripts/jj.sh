JUMP_TABLE_PATH=~/.jj_table

# jump-jump: jump to a directory specified in the jj jump table
function jj() {
  LINE=$(grep $1 $JUMP_TABLE_PATH)
  set $LINE
  cd $2
}

# pull the first column out of the jump table and complete on it as a wordlist
complete -W "$(cat $JUMP_TABLE_PATH | awk '{print $1}')" jj
