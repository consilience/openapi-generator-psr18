# openapi-generator-psr18
Templates to generate a PSR-18/PSR-17/PSR-7 client package for PHP.

Templates to generate a composer package from an OpenAPI spec. that uses a
[PSR-18](https://www.php-fig.org/psr/psr-18/)
HTTP client rather than a Guzzle client.

This then allows us to leverage existing PSR-18 decorators to apply
authentication and other features.

The models and requests will have some opinionated features that the
current models do not support.
