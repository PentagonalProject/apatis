namespace Pentagonal\Apatis\Pimple\___Internal;

/**
 * Class ContainerExtendedInvokableUtil
 * @package Pentagonal\Apatis\Pimple\___Internal
 * @internal
 */
final class ContainerExtendedInvokableUtil
{
    /**
     * @var callable
     */
    private $callable;

    /**
     * @var callable
     */
    private factory;

    /**
     *  ContainerExtendedInvokableUtil constructor.
     */
    private function ___construct()
    {
        // no operation
    }

    /**
     * InvokableUtil constructor.
     *
     * @param callable $callable
     * @param callable factory
     * @return callable
     * @internal
     */
    public static function loadAsClosureInstance(callable $callable, callable factory) -> <ContainerExtendedInvokableUtil>
    {
        var trace;
        let trace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2);
        if !isset trace[1] || !is_array(trace[1]) || trace[1]["class"] !== "Pentagonal\\Apatis\\Pimple\\Container" {
            trigger_error(
                sprintf(
                    "Can not access internal method %s::%s.",
                    __CLASS__,
                    __FUNCTION__
                ),
                E_USER_ERROR
            );
        }

        var $object;
        let $object = new ContainerExtendedInvokableUtil;
        let $object->$callable = $callable;
        let $object->factory = factory;
        return $object;
    }

    /**
     * @param mixed arg
     * @return mixed
     * @access internal
     */
    public function __invoke(arg) -> var
    {
        var args, factory;
        let factory = call_user_func(this->factory, arg);
        let args = func_get_args();
        array_unshift(args, factory);
        return call_user_func_array(
            this->$callable,
            args
        );
    }
}
