#!/bin/bash

extra_files=""
if [ $# -eq 1 ]; then
  extra_files=$1
fi

function package {
  local name=$1
  local targetname=$2
  local exe=$3
  echo "Packaging ${exe}"
  # Minimum content
  local keter_contents="${name}-exe config ${extra_files}"
  # Include static if present
  if [ -d "static" ]; then
    keter_contents="${keter_contents} static"
  fi

  echo "Starting... ( ${targetname} )"
  echo "1. cp ${exe} ."
  cp ${exe} .
  echo "2. strip ${name}-exe (SKIPPED)"
  #gstrip ./${name}-exe
  echo "3. create keter dist"
  tar -zcf ${targetname}.keter ${keter_contents}
  echo "4. remove ${name}-exe (SKIPPED)"
  # rm ${name}-exe
  echo "... done"
}

name=$(basename `pwd`)
exe_linux="./.stack-work/install/x86_64-linux-nopie/lts-9.3/8.0.2/bin/${name}-exe"
exe_osx="./.stack-work/install/x86_64-osx/lts-9.3/8.0.2/bin/${name}-exe"

package ${name} "${name}-linux" ${exe_linux}
package ${name} "${name}-osx" ${exe_osx}
