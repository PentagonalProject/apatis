namespace Pentagonal\Apatis\Pimple\Psr11;

use Pentagonal\Apatis\Pimple\Container as PimpleContainer;
use Pentagonal\Apatis\Psr\Container\ContainerInterface;

/**
 * PSR-11 compliant wrapper.
 *
 * Class Container
 * @package Pentagonal\Apatis\Pimple\Psr11
 */
final class Container implements ContainerInterface
{
    /**
     * @var PimpleContainer
     */
    private container;

    /**
     * Container constructor.
     *
     * @param PimpleContainer container
     */
    public function __construct(<PimpleContainer> container)
    {
        let this->container = container;
    }

    /**
     * Finds an entry of the container by its identifier and returns it.
     *
     * @param string $id Identifier of the entry to look for.
     *
     * @throws NotFoundExceptionInterface  No entry was found for **this** identifier.
     * @throws ContainerExceptionInterface Error while retrieving the entry.
     *
     * @return mixed Entry.
     */
    public function get(string id) -> var
    {
        return this->container[id];
    }

    /**
     * Returns true if the container can return an entry for the given identifier.
     * Returns false otherwise.
     *
     * <p>`has($id)` returning true does not mean that `get($id)` will not throw an exception.
     * It does however mean that `get($id)` will not throw a `NotFoundExceptionInterface`.</p>
     *
     * @param string id Identifier of the entry to look for.
     *
     * @return bool
     */
    public function has(string id) -> bool
    {
        return isset this->container[id];
    }
}
