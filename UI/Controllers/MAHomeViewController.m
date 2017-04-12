//
//  MAHomeViewController.m
//  ExploreTableView
//
//  Created by Mahbub Ahmed on 4/1/17.
//  Copyright © 2017 Mahbub Ahmed. All rights reserved.
//

#import "MAHomeViewController.h"
#import "MACustomCell.h"
#import "MATableVIewHeaderCell.h"
#import "MATableViewFootrCell.h"
#import "MADetailViewController.h"
#import "MAConstants.h"
#import "Helper.h"


@interface MAHomeViewController ()

@end
@implementation MAHomeViewController{
    //Total item type
    NSArray *itemType;
    
    //Different kind of item array
    NSArray *fruits;
    NSArray *vegetables;
    
    //To check table section status expanded or collapsed
    BOOL fruitExpanded,veggiExpanded;
    
    //Helper class
    Helper *helper;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Registering Nib for custom cell
    //Item viewing cell
    [self.itemTable registerNib:[UINib nibWithNibName:@"MACustomCell" bundle:nil] forCellReuseIdentifier:@"ITEM_CELL"];
    
    //Header cell
    [self.itemTable registerNib:[UINib nibWithNibName:@"MATableVIewHeaderCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HEADER_CELL"];
    
    //Footer Cell
    [self.itemTable registerNib:[UINib nibWithNibName:@"MATableViewFootrCell" bundle:nil] forHeaderFooterViewReuseIdentifier:@"FOOTER_CELL"];
    
    //by default section expanded is set to false
    fruitExpanded=false;
    veggiExpanded=false;
    
    //Item types
    itemType=@[@"Fruit",@"Vegetable"];
    
    //Get all items from plist
    [self getItemsFromPlist];
    
    self.title=@"Fruits & Veggie";
    
}

//Geting items from plist
-(void)getItemsFromPlist{
    //Getting the path for item.plist form main Bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"item" ofType:@"plist"];
    
    //Using the path to get the plist
    NSMutableArray *items = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    //plist first array contains all fruit list
    fruits=items[FRUIT_SECTION];
    
    ////plist second array contains all vegetable list
    vegetables=items[VEGETABLE_SECTION];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -tableview delegate & dataSource

//Total number f section in Table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return TOTAL_SECTION;
}
//Table view header height
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  HEADER_HEIGHT;
}

//Table view footer height
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return FOOTER_HEIGHT;
}

//Total number of row in each section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Fruit section
    if(section==FRUIT_SECTION ){
        //If fruit section already expanded return total number of fruits to show the whole list
        if(fruitExpanded==true ){
            return [fruits count];
        }
        //Or return the number of rows you want to show when section is collapsed
        else{
            return 4;
        }
    }
    //If vegetable section already expanded return total number of expanded to show the whole list
    if(section==VEGETABLE_SECTION ){
        if(veggiExpanded==true ){
            return [vegetables count];
        }
        //Or return the number of rows you want to show when section is collapsed
        else{
            return 3;
        }
    }
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ITEM_CELL";
    
    MACustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"MACustomCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    //If its fruit section use the fruit array
    if(indexPath.section==FRUIT_SECTION){
        
        cell.itemName.text=[fruits objectAtIndex:indexPath.row];
        
        //I am using all the image name for related fruit same as the fruit name but all latter in lower case
        //So converting the fruit name into lower case and adding the  image extension
        NSString *imageName=[NSString stringWithFormat:@"%@%@", [cell.itemName.text lowercaseString], @".jpg"];
        
        //Resizing the image using helper class
        cell.itemImage.image=[Helper resizeImage:[UIImage imageNamed:imageName] width:50 height:55];
        
    }else{
        cell.itemName.text=[vegetables objectAtIndex:indexPath.row];
        
        //Same as fruit image name same as vegetable name but in lower case
        //So converting the vegetable name into lower case and adding the  image extension
        NSString *imageName=[NSString stringWithFormat:@"%@%@", [cell.itemName.text lowercaseString], @".jpg"];
        
        //Resizing the image using helper class
        cell.itemImage.image=[Helper resizeImage:[UIImage imageNamed:imageName] width:50 height:55];
    }
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *CellIdentifier = @"HEADER_CELL";
    MATableVIewHeaderCell * customHeaderCell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
    
    
    NSString *imageName=[NSString stringWithFormat:@"%@%@", [itemType[section] lowercaseString], @".jpg"];
   customHeaderCell.sectionImage.image=[Helper resizeImage:[UIImage imageNamed:imageName] width:398 height:100];
    customHeaderCell.sectionTitle.text=itemType[section];
    
    return customHeaderCell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    static NSString *CellIdentifier = @"FOOTER_CELL";
    MATableViewFootrCell *customFooterCell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
    
    //Setting the button tag as section value
    //so we can use it to keep track of which section button was clicked 
    [customFooterCell.moreButton setTag:section];
    
    //Changing the button image when section is expended
    if(section==FRUIT_SECTION && fruitExpanded==true){
        [customFooterCell.moreButton setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    }
    else if(section==VEGETABLE_SECTION && veggiExpanded==true)
    {
        [customFooterCell.moreButton setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    }
    
    //Adding acction for footer button
    [customFooterCell.moreButton  addTarget:self action:@selector(moreButton:)forControlEvents:UIControlEventTouchUpInside];
    
    return customFooterCell;
}

//Forwarding to detailView when user select a row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initilizing the detail view controller
    MADetailViewController *detailViewController = [[MADetailViewController alloc] initWithNibName:@"MADetailViewController" bundle:nil];
    
    //Forwarding or Transferring data (in my case item name) to the detail view controller
    //Here item is a property of detailViewController
    if(indexPath.section==FRUIT_SECTION){
        detailViewController.item=[fruits objectAtIndex:indexPath.row];
    }else{
        detailViewController.item=[vegetables objectAtIndex:indexPath.row];
    }
    
    //Adding the detailview controller to navigation controller
    [self.navigationController pushViewController:detailViewController animated:YES];
  
}

#pragma mark -moreButoon action
//Expand or collaps table view section
-(void)moreButton: (id)sender{

    //Fruit section
    if([sender tag]==FRUIT_SECTION){
        //If 'fruit section' is already expanded  needs to collaps it
        //else 'fruit section' is collapsed so needs to expand it
        
        //If fruitExpanded =true it will change it to false and vice versa
        fruitExpanded=!fruitExpanded;
    }
    //Vegetable section
    else{
        //If 'vegetable section' is already expanded  needs to collaps it
        //else 'vegetable section' is collapsed so needs to expand it
        
        //If veggiExpanded =true it will change it to false and vice versa
        veggiExpanded=!veggiExpanded;

    }
    //Begning table view update
    [self.itemTable beginUpdates];

    //Reloading the specific section that was clicked
    [self.itemTable reloadSections:[NSIndexSet indexSetWithIndex:[sender tag]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //Ending table view update
    [self.itemTable endUpdates];
}

@end
