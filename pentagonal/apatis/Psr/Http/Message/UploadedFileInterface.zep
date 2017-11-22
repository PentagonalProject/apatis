namespace Pentagonal\Apatis\Psr\Http\Message;

/**
 * Value object representing a file uploaded through an HTTP request.
 *
 * Instances of this interface are considered immutable; all methods that
 * might change state <b>MUST</b> be implemented such that they retain the internal
 * state of the current instance and return an instance that contains the
 * changed state.
 */
interface UploadedFileInterface
{
    /**
     * Retrieve a stream representing the uploaded file.
     *
     * <p>This method <b>MUST</b> return a StreamInterface instance, representing the
     * uploaded file. The purpose of this method is to allow utilizing native PHP
     * stream functionality to manipulate the file upload, such as
     * stream_copy_to_stream() (though the result will need to be decorated in a
     * native PHP stream wrapper to work with such functions).</p>
     *
     * <p>If the moveTo() method has been called previously, this method <b>MUST</b> raise
     * an exception.</p>
     *
     * @return StreamInterface Stream representation of the uploaded file.
     * @throws \RuntimeException in cases when no stream is available or can be
     *     created.
     */
    public function getStream() -> <StreamInterface>;

    /**
     * Move the uploaded file to a new location.
     *
     * <p>Use this method as an alternative to move_uploaded_file(). This method is
     * guaranteed to work in both SAPI and non-SAPI environments.
     * Implementations must determine which environment they are in, and use the
     * appropriate method (move_uploaded_file(), rename(), or a stream
     * operation) to perform the operation.</p>
     *
     * <p>$targetPath may be an absolute path, or a relative path. If it is a
     * relative path, resolution should be the same as used by PHP's rename()
     * function.</p>
     *
     * <p>The original file or stream <b>MUST</b> be removed on completion.</p>
     *
     * <p>If this method is called more than once, any subsequent calls <b>MUST</b> raise
     * an exception.</p>
     *
     * <p>When used in an SAPI environment where $_FILES is populated, when writing
     * files via moveTo(), is_uploaded_file() and move_uploaded_file() SHOULD be
     * used to ensure permissions and upload status are verified correctly.</p>
     *
     * <p>If you wish to move to a stream, use getStream(), as SAPI operations
     * cannot guarantee writing to stream destinations.</p>
     *
     * @see http://php.net/is_uploaded_file
     * @see http://php.net/move_uploaded_file
     * @param string targetPath Path to which to move the uploaded file.
     * @throws \InvalidArgumentException if the $targetPath specified is invalid.
     * @throws \RuntimeException on any error during the move operation, or on
     *     the second or subsequent call to the method.
     */
    public function moveTo(string targetPath);
    
    /**
     * Retrieve the file size.
     *
     * <p>Implementations <b>SHOULD</b> return the value stored in the "size" key of
     * the file in the <code>$_FILES</code> array if available, as PHP calculates this based
     * on the actual size transmitted.</p>
     *
     * @return int|null The file size in bytes or null if unknown.
     */
    public function getSize() -> int|null;
    
    /**
     * Retrieve the error associated with the uploaded file.
     *
     * <p>The return value <b>MUST</b> be one of PHP's UPLOAD_ERR_XXX constants.</p>
     *
     * <p>If the file was uploaded successfully, this method <b>MUST</b> return
     * UPLOAD_ERR_OK.<p>
     *
     * <p>Implementations <b>SHOULD<b> return the value stored in the "error" key of
     * the file in the <code>$_FILES</code> array.</p>
     *
     * @see http://php.net/manual/en/features.file-upload.errors.php
     * @return int One of PHP's UPLOAD_ERR_XXX constants.
     */
    public function getError() -> int;
    
    /**
     * Retrieve the filename sent by the client.
     *
     * <p>Do not trust the value returned by this method. A client could send
     * a malicious filename with the intention to corrupt or hack your
     * application.</p>
     *
     * <p>Implementations <b>SHOULD</b> return the value stored in the "name" key of
     * the file in the <code>$_FILES</code> array.</p>
     *
     * @return string|null The filename sent by the client or null if none
     *     was provided.
     */
    public function getClientFilename() -> string|null;

    /**
     * Retrieve the media type sent by the client.
     *
     * <p>Do not trust the value returned by this method. A client could send
     * a malicious media type with the intention to corrupt or hack your
     * application.</p>
     *
     * <p>Implementations <b>SHOULD</b> return the value stored in the "type" key of
     * the file in the <code>$_FILES</code> array.</p>
     *
     * @return string|null The media type sent by the client or null if none
     *     was provided.
     */
    public function getClientMediaType() -> string|null;
}
