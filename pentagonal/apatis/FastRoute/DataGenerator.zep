namespace Pentagonal\Apatis\FastRoute;

/**
 * Interface DataGenerator
 * @package Pentagonal\Apatis\FastRoute
 */
interface DataGenerator
{
    /**
     * Adds a route to the data generator. The route data uses the
     * same format that is returned by <code>RouterParser::parser()</code>.
     *
     * <p>The handler doesn't necessarily need to be a callable, it
     * can be arbitrary data that will be returned when the route
     * matches.</p>
     *
     * @param string    httpMethod
     * @param array     routeData
     * @param mixed     handler
     */
    public function addRoutes(string! httpMethod, array routeData, handler) -> void;

    /**
     * Returns dispatcher data in some unspecified format, which
     * depends on the used method of dispatch.
     *
     * @return array
     */
    public function getData() -> array;
}
