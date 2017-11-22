namespace Pentagonal\Apatis\Pimple;

/**
 * Lazy service iterator.
 *
 * Class ServiceIterator
 * @package Pentagonal\Apatis\Pimple
 */
final class ServiceIterator implements \Iterator
{
    /**
     * @var Container
     */
    private container;

    /**
     * @var array
     */
    private ids;

    /**
     * ServiceIterator constructor.
     *
     * @param Container container
     * @param array ids
     */
    public function __construct(<Container> container, array ids)
    {
        let this->container = container;
        let this->ids = ids;
    }

    /**
     * Rewind the Iterator to the first element
     *
     * @link http://php.net/manual/en/iterator.rewind.php
     * @return void Any returned value is ignored.
     */
    public function rewind() -> void
    {
        reset(this->ids);
    }

    /**
     * Return the current element
     *
     * @link http://php.net/manual/en/iterator.current.php
     * @return mixed Can return any type.
     */
    public function current() -> var
    {
        return this->container[current(this->ids)];
    }

    /**
     * Return the key of the current element
     *
     * @link http://php.net/manual/en/iterator.key.php
     * @return mixed scalar on success, or null on failure.
     */
    public function key() -> var
    {
        return current(this->ids);
    }

    /**
     * Move forward to next element
     * @link http://php.net/manual/en/iterator.next.php
     * @return void Any returned value is ignored.
     */
    public function next() -> void
    {
        next(this->ids);
    }

    /**
     * Checks if current position is valid
     * @link http://php.net/manual/en/iterator.valid.php
     *
     * @return boolean The return value will be casted to boolean and then evaluated.
     * Returns true on success or false on failure.
     */
    public function valid() -> bool
    {
        return null !== key(this->ids);
    }
}
