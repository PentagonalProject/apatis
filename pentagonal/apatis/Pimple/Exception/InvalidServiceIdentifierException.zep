namespace Pentagonal\Apatis\Pimple\Exception;

/**
 * An attempt to perform an operation that requires a service identifier was made.
 *
 * Class InvalidServiceIdentifierException
 * @package Pentagonal\Apatis\Pimple\Exception
 */
class InvalidServiceIdentifierException extends \InvalidArgumentException implements \Pentagonal\Apatis\Psr\Container\NotFoundExceptionInterface
{
    /**
     * @param string id The invalid identifier
     */
    public function __construct(id)
    {
        parent::__construct(
            sprintf(
                "Identifier \"%s\" does not contain an object definition.",
                id
            )
        );
    }
}
