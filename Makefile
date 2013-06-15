ENCRYPTED=google-calendar-privatekey.p12 google-calendar.json
ENCRYPTED_TARGETS=$(addprefix credentials/, $(addsuffix .cast5, $(ENCRYPTED)))

credentials/%.cast5 : credentials/%
	openssl cast5-cbc -e -in $< -out $<.cast5
	@echo "DF" $@ "----" $<

.PHONY: thing
encrypt : $(ENCRYPTED_TARGETS)
	@echo "Mike  " $<

# CREDS_FILE=config/credentials.json
# .PHONY: _pwd_prompt decrypt_conf encrypt_conf
# 'private' task for echoing instructions
#pwd_prompt:
#	@echo "Contact mike@bocoup.com for the password."
#
## to create conf/settings.json
#decrypt_conf: _pwd_prompt
#	openssl cast5-cbc -d -in ${CREDS_FILE}.cast5 -out ${CREDS_FILE}
#	chmod 600 ${CREDS_FILE}
#
## for updating conf/settings.json
#encrypt_conf: _pwd_prompt
#	openssl cast5-cbc -e -in ${CREDS_FILE} -out ${CREDS_FILE}.cast5
