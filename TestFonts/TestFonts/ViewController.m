//
//  ViewController.m
//  TestFonts
//
//  Created by baishiqi on 16/7/4.
//  Copyright © 2016年 baishiqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //字体家族总数
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //字体家族包括的字体库总数
    return [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:section] ] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //字体家族名称
    return [[UIFont familyNames] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
    return index;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    //字体家族名称
    NSString *familyName= [[UIFont familyNames] objectAtIndex:indexPath.section];
    
    //字体家族中的字体库名称
    NSString *fontName  = [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    //    NSLog(@"%@",fontName);
    cell.textLabel.font = [UIFont fontWithName:fontName size:14.0f];
    
    cell.textLabel.text=@"北京30°ABCabc";
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", familyName, fontName ];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //字体家族名称
    //    NSString *familyName= [[UIFont familyNames] objectAtIndex:indexPath.section];
    
    //字体家族中的字体库名称
    NSString *fontName  = [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    
    NSLog(@"%@",fontName);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
