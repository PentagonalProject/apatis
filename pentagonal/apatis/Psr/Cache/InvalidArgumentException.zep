namespace Pentagonal\Apatis\Psr\Cache;

/**
 * Exception interface for invalid cache arguments.
 *
 * Any time an invalid argument is passed into a method it must throw an
 * exception class which implements Pentagonal\Apatis\Psr\Cache\InvalidArgumentException.
 *
 * Interface InvalidArgumentException
 * @package Pentagonal\Apatis\Psr\Cache
 */
interface InvalidArgumentException extends CacheException
{
}
