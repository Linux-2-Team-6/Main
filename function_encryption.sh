#!/bin/bash

#***********************************#
# function_encryption.sh            #
# author: michael                   #
# nov 10, 2020                      #
#                                   #
# Encrypt/Decrypt files             #
#***********************************#

# Problems
#+ Why isn't the decryption prompted for a passphrase?
#+ For automation we probably need keys instead of passphrase?

# Declare return codes
CRYPTO_SUCCESS=0
CRYPTO_FAIL=1

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# encrypt ()                                        #
# Parameter: filename                               #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

# KEYS?!

function encrypt () {
 local FILENAME=$1 # Pass argument 1 to FILENAME
 if [[ -f "$FILENAME" ]] # Check if file exists, return new filename and success
 then
  gpg -c "$FILENAME" # Encrypt file with symmetric cipher (AES-128), user will be prompted for a passphrase twice
  if [[ $? -eq 0 ]] # If encryption was successful
  then
   ENCRYPT_STATUS=$CRYPTO_SUCCESS # Set status to success
   echo "\"$FILENAME\" encrypted as \"$FILENAME.gpg\"" # Print out the new filename
   #rm $FILENAME # Remove the old unencrypted file
  else # If encryption failed
   echo "Encryption failed" 
   ENCRYPT_STATUS=$CRYPTO_FAIL # Set status to fail
  fi
 else # If file doesn't exist, return fail
  ENCRYPT_STATUS=$CRYPTO_FAIL # Set status to fail
 fi
}

# test / debug
#encrypt $1

#+++++++++++++++++++++++++++++++++++++++++++++++++++#
# decrypt ()                                        #
# Parameter: filename                               #
#+++++++++++++++++++++++++++++++++++++++++++++++++++#

function decrypt () {
 local FILENAME=$1 # Pass argument 1 to FILENAME
 if [[ -f "$FILENAME" ]] # Check if file exists, return XX? and success
 then
  # Retrieve the old filename without .gpg extension by splitting the string
  IFS="." # set delimiter
  read -ra NEWFILENAME <<< "$FILENAME" # split FILENAME by delimiter
  
  # Decrypt file ---
  gpg -d "$FILENAME" > "${NEWFILENAME[0]}" # Decrypt file
  if [[ $? -eq 0 ]] # If decryption was successful
  then
   DECRYPT_STATUS=$CRYPTO_SUCCESS # Set status to success
   echo "\"$FILENAME\" decrypted as \"$NEWFILENAME\"" # Print out the new(old) filename
  else # If encryption failed
   echo "Decryption failed" 
   DECRYPT_STATUS=$CRYPTO_FAIL # Set status to fail
  fi
 else # if file doesn't exist, return fail
  DECRYPT_STATUS=$CRYPTO_FAIL
 fi
}

# test / debug
#decrypt $1