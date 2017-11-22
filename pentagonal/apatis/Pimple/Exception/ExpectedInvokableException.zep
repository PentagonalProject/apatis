namespace Pentagonal\Apatis\Pimple\Exception;

/**
 * A closure or invokable object was expected.
 *
 * Class ExpectedInvokableException
 * @package Pentagonal\Apatis\Pimple\Exception
 */
class ExpectedInvokableException extends \InvalidArgumentException implements \Pentagonal\Apatis\Psr\Container\ContainerExceptionInterface
{
}
