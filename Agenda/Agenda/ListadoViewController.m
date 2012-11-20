//
//  ListadoViewController.m
//  Agenda
//
//  Created by J05u3 on 03/10/12.
//  Copyright (c) 2012 J05u3. All rights reserved.
//

#import "ListadoViewController.h"
#import "Contacto.h"
#import "DetalleViewController.h"

@interface ListadoViewController ()

@end

@implementation ListadoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    Contacto *contacto1=[[Contacto alloc]init];
    Contacto *contacto2=[[Contacto alloc]init];
    Contacto * contacto3=[[Contacto alloc]init];
    Contacto * contacto4=[[Contacto alloc]init];
    contacto1.nombre=@"j05u3";
    contacto1.apellidos=@"h3rn4nd3z";
    contacto2.nombre=@"juan";
    contacto2.apellidos=@"martinez";
    contacto3.nombre=@"Hefzi";
    contacto3.apellidos=@"Gallegos";
    contacto4.nombre=@"Amor";
    contacto4.apellidos=@"Hernandez Gallegos";
    arrayContactos= [[NSArray alloc]initWithObjects:contacto1,contacto2,contacto3,contacto4 , nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [arrayContactos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Contacto *contactoTemp=[arrayContactos objectAtIndex:indexPath.row];
    cell.textLabel.text=contactoTemp.nombre;
    cell.tag=indexPath.row;
    NSLog(@"%@",[NSString stringWithFormat:@"%d",indexPath.row+1]);
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goToDetalle"]) {
        
        UITableViewCell *cell=(UITableViewCell *)sender;
        DetalleViewController *detalleViewController=(DetalleViewController *)segue.destinationViewController;
        detalleViewController.contacto=[arrayContactos objectAtIndex:cell.tag];
    }
}

@end
