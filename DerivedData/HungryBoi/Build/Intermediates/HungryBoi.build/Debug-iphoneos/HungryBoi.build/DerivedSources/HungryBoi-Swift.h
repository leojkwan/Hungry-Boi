// Generated by Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import ObjectiveC;
@import WatchConnectivity;
@import CoreData;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class PhoneToWatchService;
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC9HungryBoi11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, readonly, strong) PhoneToWatchService * _Nonnull watchService;
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class Recipe;
@class NSPersistentContainer;
@class UITableView;
@class UITableViewCell;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC9HungryBoi24FoodRecipeViewController")
@interface FoodRecipeViewController : UITableViewController
@property (nonatomic, copy) NSArray<Recipe *> * _Nullable recipes;
@property (nonatomic, strong) NSPersistentContainer * _Null_unspecified persistentContainer;
- (void)viewDidLoad;
- (void)deleteAt:(NSInteger)index;
- (IBAction)add:(id _Nonnull)sender;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (BOOL)tableView:(UITableView * _Nonnull)tableView canEditRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIImageView;

SWIFT_CLASS("_TtC9HungryBoi17FoodTableViewCell")
@interface FoodTableViewCell : UITableViewCell
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, copy) NSString * _Nonnull identifier;)
+ (NSString * _Nonnull)identifier;
+ (void)setIdentifier:(NSString * _Nonnull)value;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified foodNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView * _Null_unspecified foodImageView;
@property (nonatomic, strong) Recipe * _Nullable recipe;
- (void)awakeFromNib;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class WCSession;

SWIFT_CLASS("_TtC9HungryBoi19PhoneToWatchService")
@interface PhoneToWatchService : NSObject <WCSessionDelegate>
@property (nonatomic, readonly, strong) NSPersistentContainer * _Nonnull persistentContainer;
- (nonnull instancetype)initWithPersistentContainer:(NSPersistentContainer * _Nonnull)persistentContainer OBJC_DESIGNATED_INITIALIZER;
- (void)session:(WCSession * _Nonnull)session didReceiveApplicationContext:(NSDictionary<NSString *, id> * _Nonnull)applicationContext;
- (void)session:(WCSession * _Nonnull)session didReceiveUserInfo:(NSDictionary<NSString *, id> * _Nonnull)userInfo;
- (void)setupWatchConnectivity;
- (void)setupCoreDataWatchManagerWithPersistentContainer:(NSPersistentContainer * _Nonnull)persistentContainer;
- (void)sendRecipesToWatchWithRecipes:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)recipes;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface PhoneToWatchService (SWIFT_EXTENSION(HungryBoi))
/**
  Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession.
*/
- (void)sessionDidDeactivate:(WCSession * _Nonnull)session;
/**
  Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed.
*/
- (void)sessionDidBecomeInactive:(WCSession * _Nonnull)session;
/**
  Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details.
*/
- (void)session:(WCSession * _Nonnull)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError * _Nullable)error;
@end

@class NSManagedObjectContext;
@class NSEntityDescription;

SWIFT_CLASS("_TtC9HungryBoi6Recipe")
@interface Recipe : NSManagedObject
- (nonnull instancetype)initWithName:(NSString * _Nonnull)name context:(NSManagedObjectContext * _Nonnull)context;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end


@interface Recipe (SWIFT_EXTENSION(HungryBoi))
@property (nonatomic, copy) NSString * _Nonnull name;
+ (void)fetchFrom:(NSPersistentContainer * _Nonnull)container completion:(void (^ _Nonnull)(NSArray<Recipe *> * _Nonnull))completion;
@end

#pragma clang diagnostic pop
