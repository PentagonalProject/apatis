namespace Pentagonal\Apatis\Pimple;

/**
 * Pimple service provider interface.
 *
 * Interface ServiceProviderInterface
 * @package Pentagonal\Apatis\Pimple
 */
interface ServiceProviderInterface
{
    /**
     * Registers services on the given container.
     *
     * <p>This method should only be used to configure services and parameters.
     * It should not get services.</p>
     *
     * @param Container pimple A container instance
     */
    public function register(<Container> pimple);
}
