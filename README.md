# ExploreTableView

<!---  ExploreTableView
Created by Mahbub Ahmed on 2/17/2017
Copyright © 2017 Mahbub Ahmed. All rights reserved.
-->

[![Platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)]()
[![Programming Language](https://img.shields.io/badge/language-objective--c-ff69b4.svg)]()
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](/LICENSE.md)

The main aim of ExploreTableView project covers some useful and handy features of UITableView using nib.
This includes: like adding header and footer cell using nib file, expand and collapse table view etc. and use of nib file.


# Components:

-	[UITableView Section](#uitableview-section)  
-	[UITableView With Custom Header and Footer Cell](#uitableview-with-custom-header-and-footer-cell)  
-	[UITableView Expand And Collapse](#uitableview-expand-and-collapse)  
-	[Forwarding Data On Row Selection](#forwarding-data-on-row-selection)  


## UITableView Section
Table view can consist of any number of section/group you want and each section can contain different type of data. Also each section can have separate header and footer.  
###### UITableViewDataSource method is used to determine total number of section
```objective-c
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
```

## UITableView With Custom Header and Footer Cell
Table view can have header and footer that are useful for custom design. Table view with multiple sections can have separate header and footer for each section (aka: section header and footer). Custom cell (nib) can be used to design the header and footer.
* [Custom Header](https://github.com/Mahbub-Ahmed/ExploreTableView/tree/master/UI/Views/CustomTableViewCell/TableViewHeaderCell)
* [Custom Footer](https://github.com/Mahbub-Ahmed/ExploreTableView/tree/master/UI/Views/CustomTableViewCell/TableViewFooterCell)

###### Table view delegate method for header and footer  
```objective-c
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
```

## UITableView Expand And Collapse
One of the most interesting features of table view is that you can make it expand and collapse. Collapse/Expand action can be easily added on header or footer of tableView. 
Even it is possible to show few cell always and hide rest to expand, and on each section number of visible cell can be different.
* [Expand And Collapse](https://github.com/Mahbub-Ahmed/ExploreTableView/blob/master/UI/Controllers/MAHomeViewController.m)


## Forwarding Data On Row Selection
If your table cell is selectable that means you need to pass the selected cell to another view 
On selectable table view you can pass selected cell related data to another view, it can be done using UITableView delegate method   
```objective-c
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
``` 

## License
ExploreTableView is licensed under the terms of the MIT License. For full details please see the [LICENSE](https://github.com/Mahbub-Ahmed/ExploreTableView/blob/master/LICENSE)
