// Zephir does not support trait yet

namespace Pentagonal\Apatis\Psr\Log;

/**
 * Basic Implementation of LoggerAwareInterface.
 *
 * Trait LoggerAwareTrait
 * @package Pentagonal\Apatis\Psr\Log
 */
trait LoggerAwareTrait
{
    /**
     * The logger instance.
     *
     * @var LoggerInterface
     */
    protected logger;

    /**
     * Sets a logger.
     *
     * @param LoggerInterface logger
     */
    public function setLogger(<LoggerInterface> logger) -> void
    {
        this->logger = logger;
    }
}
