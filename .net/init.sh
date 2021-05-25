# This will create inventory & ansible.cfg to match your uniNetwork. You can use the default - Dyanmic Inventory - or edit static files.
# You can then edit inventory files in net/hosts and it'll be ignored by git.

net(){
  # Copy templates to hosts
  mkdir -p hosts
  cd template
  for f in *.j2
  do
    file=`echo $f | sed 's/.j2//'`
    [[ -f ../hosts/$file ]] | cp $f ../hosts/$file
  done

  cp ansible.cfg ../../
  cd -
}

this(){
  cd ..
  if [ -d "this/.this" ]
  then
    [[ -d this/this ]] || cp -r this/.this this/this
  fi
}

main(){
  net
  this
}
main
