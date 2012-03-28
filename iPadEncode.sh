#!/bin/sh

mencoder -profile ipnp1 -nosub -o "${2}" "${1}"
mencoder -profile ipnp2 -nosub -o "${2}" "${1}"
