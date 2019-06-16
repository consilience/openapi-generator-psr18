# Templates

## php-psr18

Taken from https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/php
to form the basis of a PSR-18 client package

Uses the `php` generation logic (https://github.com/OpenAPITools/openapi-generator/blob/master/modules/openapi-generator/src/main/java/org/openapitools/codegen/languages/PhpClientCodegen.java)

Command syntax is:

    generate.sh {openapi-spec.oas3} Base\Namespace

The `\` may need to be doubled up if not single-quoted.

The generated client will be put into the `generated\{openapi-spec}` directory.

