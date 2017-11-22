namespace Pentagonal\Apatis\Pimple\Exception;

/**
 * An attempt to modify a frozen service was made.
 *
 * Class FrozenServiceException
 * @package Pentagonal\Apatis\Pimple\Exception
 */
class FrozenServiceException extends \RuntimeException implements \Pentagonal\Apatis\Psr\Container\ContainerExceptionInterface
{
    /**
     * @param string id Identifier of the frozen service
     */
    public function __construct(id)
    {
        parent::__construct(
            sprintf(
                "Cannot override frozen service \"%s\".",
                 id
            )
        );
    }
}
