function liveclock -d "show live clock" -a lines
  test -z lines && set lines 1
  while true
    date
    printf "\x1B[%sA" $lines
  end
end

