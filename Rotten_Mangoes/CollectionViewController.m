//
//  CollectionViewController.m
//  Rotten_Mangoes
//
//  Created by Rene Mojica on 2016-07-18.
//  Copyright © 2016 Rene Mojica. All rights reserved.
//

#import "CollectionViewController.h"
#import "DetailViewController.h"
#import "CVCell.h"
#import "Film.h"

@interface CollectionViewController ()

@property (nonatomic, strong) NSMutableArray *movies;


@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"CustomCell";

- (void)loadData {
    
    NSURL *url = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=sr9tdu3checdyayjz85mff8j&country=CA&page_limit=5"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
  
            
            NSError *jsonError;
            
            NSDictionary *movieDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (!jsonError) {
                
                NSLog(@"JSON: %@", movieDict);
                
                NSMutableArray *moviesArray = [NSMutableArray array];
                
                for (NSDictionary *movie in movieDict[@"movies"]) {
                    
                    Film *film = [[Film alloc] init];
                    film.filmTitle = movie[@"title"];
                    film.filmYear = movie[@"year"];
                    film.filmSynopsis = movie[@"synopsis"];
                    NSString *urlString = movie[@"posters"][@"thumbnail"];
                    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
                    film.filmThumbNail = [UIImage imageWithData: imageData];
                    [moviesArray addObject:film];
                    
                }
                
                self.movies = moviesArray;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.title = [NSString stringWithFormat:@"%ld movies", self.movies.count];
                   [self.collectionView reloadData];
                });
                
            }
            
            
        } else {
            NSLog(@"Request error: %@", error.localizedDescription);
        }
        
    }];
    
    [dataTask resume];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    
    if ([segue.identifier isEqual: @"showDetail"]){
        
//        NSIndexPath *indexPath = [self.collectionView indexPathsForSelectedItems].firstObject;
//        Film *movie = self.movies[indexPath.row];
        
        DetailViewController *detailVC = [[DetailViewController alloc]init];
        detailVC = [segue destinationViewController];
        detailVC.movie = (Film *) sender;
        
    }
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.labelTitle.text = [self.movies[indexPath.row] filmTitle];
    cell.labelYear.text = [NSString stringWithFormat:@"%@",[self.movies[indexPath.row] filmYear]];
    cell.imageView.image = (UIImage *)[self.movies[indexPath.row] filmThumbNail];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {    //called before prepareForSegue
    
   NSIndexPath *path = [[collectionView indexPathsForSelectedItems] firstObject];
    [self performSegueWithIdentifier:@"showDetail" sender:self.movies[path.row]];
    
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
