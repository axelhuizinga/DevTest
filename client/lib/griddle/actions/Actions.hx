package griddle.actions;

import griddle.constants.Constants;

class Actions
{
    public static function getNext() {
        return {
            type: GRIDDLE_NEXT_PAGE
        }
    }

    export function getPrevious() {
        return {
            type: GRIDDLE_PREVIOUS_PAGE
        }
    }

    export function setPage(pageNumber:Int) {
        return {
            type: GRIDDLE_SET_PAGE,
            pageNumber
        };
    }

    export function setFilter(filter:GriddleFilter) {
        return {
            type: GRIDDLE_SET_FILTER,
            filter
        }
    }

    export function setSortColumn(sortProperties) {
        return {
            type: GRIDDLE_SET_SORT,
            sortProperties
        }
    }

    export function toggleSettings() {
        return {
            type: GRIDDLE_TOGGLE_SETTINGS
        }
    }
}