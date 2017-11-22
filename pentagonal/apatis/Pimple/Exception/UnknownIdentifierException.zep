namespace Pentagonal\Apatis\Pimple\Exception;

/**
 * The identifier of a valid service or parameter was expected.
 *
 * Class UnknownIdentifierException
 * @package Pentagonal\Apatis\Pimple\Exception
 */
class UnknownIdentifierException extends \InvalidArgumentException implements \Pentagonal\Apatis\Psr\Container\NotFoundExceptionInterface
{
    /**
     * @param string id The unknown identifier
     */
    public function __construct(id)
    {
        parent::__construct(
            sprintf(
                "Identifier \"%s\" is not defined.",
                id
            )
        );
    }
}
