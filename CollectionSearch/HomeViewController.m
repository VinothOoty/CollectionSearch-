//
//  HomeViewController.m
//  CollectionSearch
//
//  Created by SYZYGY01 on 19/11/15.
//  Copyright (c) 2015 Syzygy. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()


@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    [self.collectionObj registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionCell"];
    
    allArray =[[NSMutableArray alloc]init];
    BrandArray =[[NSMutableArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"Six", nil];
    StatusArr =[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    ExtraArray =[[NSMutableArray alloc]initWithObjects:@"E1",@"E2",@"E3",@"E4",@"E5",@"E6", nil];
    
    for (int i=0; i<BrandArray.count; i++)
    {
        [allArray addObject:[[Search alloc]initWithBrandName:[BrandArray objectAtIndex:i] andStatus:[StatusArr objectAtIndex:i] andExtra:[ExtraArray objectAtIndex:i]]];
    }
    [self.collectionObj reloadData];
}


//Collection View Methods//

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    NSUInteger rowCount;
    if(isFiltered)
    {
        rowCount = [BrandArray count];
    }
    
    else
    {
        rowCount = [allArray count];
    }
    return rowCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    Search* Search;
    if(isFiltered)
        Search = [BrandArray objectAtIndex:indexPath.row];
    else
        Search = [allArray objectAtIndex:indexPath.row];
    
    NSLog(@"All %@",Search.brand);
    
    cell.frst.text =[NSString stringWithFormat:@"%@",Search.brand];
    cell.scnd.text =[NSString stringWithFormat:@"%@",Search.status];
    cell.third.text =[NSString stringWithFormat:@"%@",Search.extra];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Search* Search;
    if(isFiltered)
        Search = [BrandArray objectAtIndex:indexPath.row];
    else
        Search = [allArray objectAtIndex:indexPath.row];
    
    NSLog(@"Clicked %@-%@-%@",Search.status,Search.brand,Search.extra);
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Search* Search;
    if(isFiltered)
        Search = [BrandArray objectAtIndex:indexPath.row];
    else
        Search = [allArray objectAtIndex:indexPath.row];
    
    NSString *diabetesStatus =Search.status;
    NSLog(@"Drug Status %@",diabetesStatus);
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length == 0)
    {
        isFiltered = FALSE;
        [self.view endEditing:YES];
    }
    else
    {
        isFiltered = true;
        BrandArray = [[NSMutableArray alloc] init];
        for (Search* search in allArray)
        {
            NSRange nameRange = [search.brand rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound )
            {
                [BrandArray addObject:search];
            }
        }
    }
    [self.collectionObj reloadData];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)SearchBar
{
    [self.searchObj resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
