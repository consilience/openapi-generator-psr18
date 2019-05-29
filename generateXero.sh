
java -jar openapi-generator-cli-4.0.0.jar generate \
	-i xero/Xero_accounting_2.0.0_swagger.json \
	-t resources/php-psr18 \
	-o generated/Xero_accounting \
	-g php \
	--additional-properties=srcBasePath=src \
	--additional-properties=variableNamingConvention=camelCase

