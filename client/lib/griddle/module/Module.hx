package griddle.module;

import griddle.components.*;
import react.ReactComponent.ReactComponentOfProps;

typedef PropertyBag<T> = { 
    propName:Map<String,T>
};

typedef GriddleComponent<T> = react.ReactComponentOfProps<T>;

