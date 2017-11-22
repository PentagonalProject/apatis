namespace Pentagonal\Apatis\FastRoute;

/**
 * Interface Dispatcher
 * @package Pentagonal\Apatis\FastRoute
 */
interface Dispatcher
{
    const NOT_FOUND = 0;
    const FOUND = 1;
    const METHOD_NOT_ALLOWED = 2;

    /**
     * Dispatches against the provided HTTP method verb and URI.
     *
     * <p>Returns array with one of the following formats:
     * <code>
     *     [self::NOT_FOUND]
     *     [self::METHOD_NOT_ALLOWED, ['GET', 'OTHER_ALLOWED_METHODS']]
     *     [self::FOUND, $handler, ['varName' => 'value', ...]]
     * </code></p>
     *
     * @param string httpMethod
     * @param string uri
     * @return array
     */
    public function dispatch(string! httpMethod, string! uri) -> array;
}
