enum SubMenuType { search, view, compare }

class SubMenuUtils {
  static Map<SubMenuType, String> namesOfMenus = {
    SubMenuType.search: 'Search',
    SubMenuType.view: 'View',
    SubMenuType.compare: 'Compare',
  };
}
