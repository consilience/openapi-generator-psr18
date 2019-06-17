# openapi-generator-psr18
Templates to generate a PSR-18/PSR-17/PSR-7 client package for PHP.

Templates to generate a composer package from an OpenAPI spec. that uses a
[PSR-18](https://www.php-fig.org/psr/psr-18/)
HTTP client rather than a Guzzle client.

This then allows us to leverage existing PSR-18 decorators to apply
authentication and other features.

The models and requests will have some opinionated features that the
current models do not support.

## Generating the Package

The command `bin\generate.sh` will generate the PSR-18 code. It takes options:

* -g, --generated=desination-directory
* -s, --spec=source-openapi-spec
* -n, --namespace=root-namespace

The `spec` is mandatory, but is still an option for now.

The templates being developed are under `modules/openapi-generator/src/main/resources/php-psr18/`.

The templates are taken from
https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/php

The `php` generator uses the logic defined in
https://github.com/OpenAPITools/openapi-generator/blob/master/modules/openapi-generator/src/main/java/org/openapitools/codegen/languages/PhpClientCodegen.java

The latest java command can be downloaded from
http://central.maven.org/maven2/org/openapitools/openapi-generator-cli/4.0.1/openapi-generator-cli-4.0.1.jar
and is renamed to `openapi-generator-cli.jar` to keep with the project conventions.

