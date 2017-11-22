namespace Pentagonal\Apatis\Psr\Http\Message;

/**
 * Value object representing a URI.
 *
 * This interface is meant to represent URIs according to RFC 3986 and to
 * provide methods for most common operations. Additional functionality for
 * working with URIs can be provided on top of the interface or externally.
 * Its primary use is for HTTP requests, but may also be used in other
 * contexts.
 *
 * Instances of this interface are considered immutable; all methods that
 * might change state <b>MUST</b> be implemented such that they retain the internal
 * state of the current instance and return an instance that contains the
 * changed state.
 *
 * Typically the Host header will be also be present in the request message.
 * For server-side requests, the scheme will typically be discoverable in the
 * server parameters.
 *
 * @link http://tools.ietf.org/html/rfc3986 (the URI specification)
 */
interface UriInterface
{
    /**
     * Retrieve the scheme component of the URI.
     *
     * <p>If no scheme is present, this method <b>MUST</b> return an empty string.</p>
     *
     * <p>The value returned <b>MUST</b> be normalized to lowercase, per RFC 3986
     * Section 3.1.</p>
     *
     * <p>The trailing ":" character is not part of the scheme and <b>MUST NOT</b> be
     * added.</p>
     *
     * @see https://tools.ietf.org/html/rfc3986#section-3.1
     * @return string The URI scheme.
     */
    public function getScheme() -> string;

    /**
     * Retrieve the authority component of the URI.
     *
     * <p>If no authority information is present, this method <b>MUST</b> return an empty
     * string.</p>
     *
     * <p>The authority syntax of the URI is:</p>
     *
     * <pre>
     * [user-info@]host[:port]
     * </pre>
     *
     * <p>If the port component is not set or is the standard port for the current
     * scheme, it SHOULD NOT be included.</p>
     *
     * @see https://tools.ietf.org/html/rfc3986#section-3.2
     * @return string The URI authority, in "[user-info@]host[:port]" format.
     */
    public function getAuthority() -> string;

    /**
     * Retrieve the user information component of the URI.
     *
     * <p>If no user information is present, this method <b>MUST</b> return an empty
     * string.</p>
     *
     * <p>If a user is present in the URI, this will return that value;
     * additionally, if the password is also present, it will be appended to the
     * user value, with a colon (":") separating the values.</p>
     *
     * <p>The trailing "@" character is not part of the user information and <b>MUST NOT</b> be added.</p>
     *
     * @return string The URI user information, in "username[:password]" format.
     */
    public function getUserInfo() -> string;

    /**
     * Retrieve the host component of the URI.
     *
     * <p>If no host is present, this method <b>MUST</b> return an empty string.</p>
     *
     * <p>The value returned <b>MUST</b> be normalized to lowercase, per RFC 3986
     * Section 3.2.2.</p>
     *
     * @see http://tools.ietf.org/html/rfc3986#section-3.2.2
     * @return string The URI host.
     */
    public function getHost() -> string;

    /**
     * Retrieve the port component of the URI.
     *
     * <p>If a port is present, and it is non-standard for the current scheme,
     * this method <b>MUST</b> return it as an integer. If the port is the standard port
     * used with the current scheme, this method SHOULD return null.</p>
     *
     * <p>If no port is present, and no scheme is present, this method <b>MUST</b> return
     * a null value.</p>
     *
     * <p>If no port is present, but a scheme is present, this method MAY return
     * the standard port for that scheme, but SHOULD return null.</p>
     *
     * @return null|int The URI port.
     */
    public function getPort() -> null|int;

    /**
     * Retrieve the path component of the URI.
     *
     * <p>The path can either be empty or absolute (starting with a slash) or
     * rootless (not starting with a slash). Implementations <b>MUST</b> support all
     * three syntaxes.</p>
     *
     * <p>Normally, the empty path "" and absolute path "/" are considered equal as
     * defined in RFC 7230 Section 2.7.3. But this method <b>MUST NOT</b> automatically
     * do this normalization because in contexts with a trimmed base path, e.g.
     * the front controller, this difference becomes significant. It's the task
     * of the user to handle both "" and "/".</p>
     *
     * <p>The value returned <b>MUST</b> be percent-encoded, but <b>MUST NOT</b> double-encode
     * any characters. To determine what characters to encode, please refer to
     * RFC 3986, Sections 2 and 3.3.</p>
     *
     * <p>As an example, if the value should include a slash ("/") not intended as
     * delimiter between path segments, that value <b>MUST</b> be passed in encoded
     * form (e.g., "%2F") to the instance.</p>
     *
     * @see https://tools.ietf.org/html/rfc3986#section-2
     * @see https://tools.ietf.org/html/rfc3986#section-3.3
     * @return string The URI path.
     */
    public function getPath() -> string;

    /**
     * Retrieve the query string of the URI.
     *
     * <p>If no query string is present, this method <b>MUST</b> return an empty string.</p>
     *
     * <p>The leading "?" character is not part of the query and <b>MUST NOT</b> be
     * added.</p>
     *
     * <p>The value returned <b>MUST</b> be percent-encoded, but <b>MUST NOT</b> double-encode
     * any characters. To determine what characters to encode, please refer to
     * RFC 3986, Sections 2 and 3.4.</p>
     *
     * <p>As an example, if a value in a key/value pair of the query string should
     * include an ampersand ("&") not intended as a delimiter between values,
     * that value <b>MUST</b> be passed in encoded form (e.g., "%26") to the instance.</p>
     *
     * @see https://tools.ietf.org/html/rfc3986#section-2
     * @see https://tools.ietf.org/html/rfc3986#section-3.4
     * @return string The URI query string.
     */
    public function getQuery() -> string;

    /**
     * Retrieve the fragment component of the URI.
     *
     * <p>If no fragment is present, this method <b>MUST</b> return an empty string.</p>
     *
     * <p>The leading "#" character is not part of the fragment and <b>MUST NOT</b> be
     * added.</p>
     *
     * <p>The value returned <b>MUST</b> be percent-encoded, but <b>MUST NOT</b> double-encode
     * any characters. To determine what characters to encode, please refer to
     * RFC 3986, Sections 2 and 3.5.</p>
     *
     * @see https://tools.ietf.org/html/rfc3986#section-2
     * @see https://tools.ietf.org/html/rfc3986#section-3.5
     * @return string The URI fragment.
     */
    public function getFragment() -> string;

    /**
     * Return an instance with the specified scheme.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified scheme.</p>
     *
     * <p>Implementations <b>MUST</b> support the schemes "http" and "https" case
     * insensitively, and MAY accommodate other schemes if required.</p>
     *
     * <p>An empty scheme is equivalent to removing the scheme.</p>
     *
     * @param string scheme The scheme to use with the new instance.
     * @return static A new instance with the specified scheme.
     * @throws \InvalidArgumentException for invalid or unsupported schemes.
     */
    public function withScheme(string scheme) -> <UriInterface>;

    /**
     * Return an instance with the specified user information.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified user information.</p>
     *
     * <p>Password is optional, but the user information <b>MUST</b> include the
     * user; an empty string for the user is equivalent to removing user
     * information.</p>
     *
     * @param string user The user name to use for authority.
     * @param null|string password The password associated with $user.
     * @return static A new instance with the specified user information.
     */
    public function withUserInfo(string user, password = null) -> <UriInterface>;

    /**
     * Return an instance with the specified host.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified host.</p>
     *
     * <p>An empty host value is equivalent to removing the host.</p>
     *
     * @param string host The hostname to use with the new instance.
     * @return static A new instance with the specified host.
     * @throws \InvalidArgumentException for invalid hostnames.
     */
    public function withHost(string host) -> <UriInterface>;

    /**
     * Return an instance with the specified port.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified port.</p>
     *
     * <p>Implementations <b>MUST</b> raise an exception for ports outside the
     * established TCP and UDP port ranges.</p>
     *
     * <p>A null value provided for the port is equivalent to removing the port
     * information.</p>
     *
     * @param null|int port The port to use with the new instance; a null value
     *     removes the port information.
     * @return static A new instance with the specified port.
     * @throws \InvalidArgumentException for invalid ports.
     */
    public function withPort(port) -> <UriInterface>;

    /**
     * Return an instance with the specified path.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified path.</p>
     *
     * <p>The path can either be empty or absolute (starting with a slash) or
     * rootless (not starting with a slash). Implementations <b>MUST</b> support all
     * three syntaxes.</p>
     *
     * <p>If the path is intended to be domain-relative rather than path relative then
     * it must begin with a slash ("/"). Paths not starting with a slash ("/")
     * are assumed to be relative to some base path known to the application or
     * consumer.</p>
     *
     * <p>Users can provide both encoded and decoded path characters.
     * Implementations ensure the correct encoding as outlined in getPath().</p>
     *
     * @param string path The path to use with the new instance.
     * @return static A new instance with the specified path.
     * @throws \InvalidArgumentException for invalid paths.
     */
    public function withPath(string path) -> <UriInterface>;

    /**
     * Return an instance with the specified query string.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified query string.</p>
     *
     * <p>Users can provide both encoded and decoded query characters.
     * Implementations ensure the correct encoding as outlined in getQuery().</p>
     *
     * An empty query string value is equivalent to removing the query string.
     *
     * @param string query The query string to use with the new instance.
     * @return static A new instance with the specified query string.
     * @throws \InvalidArgumentException for invalid query strings.
     */
    public function withQuery(string query) -> <UriInterface>;

    /**
     * Return an instance with the specified URI fragment.
     *
     * <p>This method <b>MUST</b> retain the state of the current instance, and return
     * an instance that contains the specified URI fragment.</p>
     *
     * <p>Users can provide both encoded and decoded fragment characters.
     * Implementations ensure the correct encoding as outlined in getFragment().</p>
     *
     * <p>An empty fragment value is equivalent to removing the fragment.</p>
     *
     * @param string fragment The fragment to use with the new instance.
     * @return static A new instance with the specified fragment.
     */
    public function withFragment(string fragment) -> <UriInterface>;

    /**
     * Return the string representation as a URI reference.
     *
     * <p>Depending on which components of the URI are present, the resulting
     * string is either a full URI or relative reference according to RFC 3986,
     * Section 4.1. The method concatenates the various components of the URI,
     * using the appropriate delimiters:</p>
     *
     * <ul>
     * <li>If a scheme is present, it <b>MUST</b> be suffixed by ":".</li>
     * <li>If an authority is present, it <b>MUST</b> be prefixed by "//".</li>
     * <li>The path can be concatenated without delimiters. But there are two
     *   cases where the path has to be adjusted to make the URI reference
     *   valid as PHP does not allow to throw an exception in __toString():
     *   <ul>
     *     <li> If the path is rootless and an authority is present, the path MUST
     *       be prefixed by "/".</li>
     *     <li> If the path is starting with more than one "/" and no authority is
     *       present, the starting slashes <b>MUST</b> be reduced to one.
     *     </li>
     *   </ul>
     * </li>
     * <li> If a query is present, it <b>MUST</b> be prefixed by "?".</li>
     * <li> If a fragment is present, it <b>MUST</b> be prefixed by "#".</li>
     * </ul>
     *
     * @see http://tools.ietf.org/html/rfc3986#section-4.1
     * @return string
     */
    public function __toString() -> string;
}
