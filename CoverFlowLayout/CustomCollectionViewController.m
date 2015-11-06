//
//  CustomCollectionViewController.m
//  CoverFlowLayout
//
//  Created by Steele on 2015-11-05.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "Photos.h"

@interface CustomCollectionViewController ()


@property (nonatomic) NSMutableArray *photosArray;


@end

@implementation CustomCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photosArray = [NSMutableArray new];
    
    Photos *photo01 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1013.JPG"] location:@"Toronto" andGroup:@"Nature"];
    Photos *photo02 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1017.JPG"] location:@"Toronto" andGroup:@"Nature"];
    Photos *photo03 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1018.JPG"] location:@"Vancouver" andGroup:@"Nature"];
    Photos *photo04 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1262.JPG"] location:@"Toronto" andGroup:@"Travel"];
    Photos *photo05 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1009.JPG"] location:@"Toronto" andGroup:@"Nature"];
    Photos *photo06 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1361.JPG"] location:@"Toronto" andGroup:@"Travel"];
    Photos *photo07 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1263.JPG"] location:@"Toronto" andGroup:@"Travel"];
    Photos *photo08 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1377.JPG"] location:@"Toronto" andGroup:@"Travel"];
    Photos *photo09 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1374.JPG"] location:@"Toronto" andGroup:@"Travel"];
    Photos *photo10 = [[Photos alloc]initWithImage:[UIImage imageNamed:@"IMG_1421.JPG"] location:@"Vancouver" andGroup:@"Travel"];
    
    [self.photosArray addObject:photo01];
    [self.photosArray addObject:photo02];
    [self.photosArray addObject:photo03];
    [self.photosArray addObject:photo04];
    [self.photosArray addObject:photo05];
    [self.photosArray addObject:photo06];
    [self.photosArray addObject:photo07];
    [self.photosArray addObject:photo08];
    [self.photosArray addObject:photo09];
    [self.photosArray addObject:photo10];

    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    // Configure the cell

    Photos *photo = [self.photosArray objectAtIndex:indexPath.item];
    
    cell.imageView.image = photo.image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
