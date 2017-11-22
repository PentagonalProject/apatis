namespace Pentagonal\Apatis\FastRoute;

/**
 * Interface RouteParser
 * @package Pentagonal\Apatis\FastRoute
 */
interface RouteParser
{
    /**
     * Parses a route string into multiple route data arrays.
     *
     * <p>The expected output is defined using an example:</p>
     *
     * <p>For the route string "/fixedRoutePart/{varName}[/moreFixed/{varName2:\d+}]", if {varName} is interpreted as
     * a placeholder and [...] is interpreted as an optional route part, the expected result is:
     * <pre>
     * [
     *     // first route: without optional part
     *     [
     *         "/fixedRoutePart/",
     *         ["varName", "[^/]+"],
     *     ],
     *     // second route: with optional part
     *     [
     *         "/fixedRoutePart/",
     *         ["varName", "[^/]+"],
     *         "/moreFixed/",
     *         ["varName2", [0-9]+"],
     *     ],
     * ]
     * </pre></p>
     *
     * <p>Here one route string was converted into two route data arrays.</p>
     *
     * @param string $route Route string to parse
     *
     * @return mixed[][] Array of route data arrays
     */
    public function parse(string! $route) -> array;
}
