namespace Pentagonal\Apatis\Psr\Container;

/**
 * Describes the interface of a container that exposes methods to read its entries.
 *
 * Interface ContainerInterface
 * @package Pentagonal\Apatis\Psr\Container
 */
interface ContainerInterface
{
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
    public function get(string id) -> var;

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
    public function has(string id) -> bool;
}
