
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/CategoryModel.dart';
import 'package:ileoja/Model/LocalGovModel.dart';
import 'package:ileoja/Model/StateModel.dart';
import 'package:ileoja/Model/SubCategoryModel.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Model/WithdrawalModel.dart';
import 'package:ileoja/Provider/category/category_provider.dart';
import 'package:ileoja/Provider/llga/lga_provider.dart';
import 'package:ileoja/Provider/state/state_provider.dart';
import 'package:ileoja/Provider/sub_category/sub_category_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Provider/withdrawal/withdrawal_provider.dart';
import 'package:ileoja/Reprository/category_repository.dart';
import 'package:ileoja/Reprository/lga_repository.dart';
import 'package:ileoja/Reprository/state_respository.dart';
import 'package:ileoja/Reprository/sub_category_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Reprository/withdrawal_repository.dart';
import 'package:ileoja/Screen/Mics/categoryScreen.dart';
import 'package:ileoja/Screen/Mics/lgaState.dart';
import 'package:ileoja/Screen/Mics/stateScreen.dart';
import 'package:ileoja/Screen/Mics/subCategoryScreen.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SellScreenIndex extends StatefulWidget {

  @override
  _MyBalanceIndexState createState() => _MyBalanceIndexState();
}

class _MyBalanceIndexState extends State<SellScreenIndex> {

  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;

  CategoryProvider categoryProvider;
  CategoryRepository categoryRepository;
  SubCategoryRepository subCategoryRepository;
  SubCategoryProvider subCategoryProvider;
  StateProvider stateProvider;
  StateRepository stateRepository;
  LGARepository lgaRepository;
  LGAProvider lgaProvider;

  bool showLGA = false;


  final TextEditingController _fullName = new TextEditingController();
  final TextEditingController _eMail = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _address = new TextEditingController();
  final TextEditingController _country = new TextEditingController();
  final TextEditingController state = new TextEditingController();
  final TextEditingController _lga = new TextEditingController();
  final TextEditingController lga = new TextEditingController();
  final TextEditingController _state = new TextEditingController();

  final TextEditingController categoryText = new TextEditingController();
  final TextEditingController subcategoryText = new TextEditingController();

  List<Asset> images = <Asset>[];
  StateModel _stateModel;
  LGAModel _lgaModel;
  CategoryModel categoryModel;
  SubCategoryModel subCategoryModel;
  bool hide = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      hide = true;
    });
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Stack(
          children: <Widget>[
            AssetThumb(
              asset: asset,
              width: 300,
              height: 300,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  images.removeAt(index);
                  setState((){
                    if(images.length == 0){
                     hide = false;
                    }
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: PsColors.redColor,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    categoryRepository = Provider.of<CategoryRepository>(context);
    subCategoryRepository = Provider.of<SubCategoryRepository>(context);
    stateRepository = Provider.of<StateRepository>(context);
    lgaRepository = Provider.of<LGARepository>(context);
    SizeConfig().init(context);

    return MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<CategoryProvider>(
            lazy: false,
            create: (BuildContext context) {
              final CategoryProvider provider = CategoryProvider(repo: categoryRepository, psValueHolder: psValueHolder);
              provider.getData(psValueHolder.apiToken);
              categoryProvider = provider;
              return categoryProvider;
            },
          ),
          ChangeNotifierProvider<StateProvider>(
            lazy: false,
            create: (BuildContext context) {
              final StateProvider provider = StateProvider(repo: stateRepository);
              provider.getData();
              stateProvider = provider;
              return stateProvider;
            },
          ),
        ],
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: textStyle(context, "Post New Ads ", 20, PsColors.black),
            material: (_, __) => MaterialAppBarData(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              //automaticallyImplyLeading: true,
            ),
            automaticallyImplyLeading: true,
          ),
          iosContentBottomPadding: true,
          iosContentPadding: true,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: 5, right: 5, left: 5),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              color: PsColors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Row(
                          children: <Widget>[
                            Text(categoryText.text == ''? 'Select Category':categoryText.text,style: setStyleContent(context,PsColors.black,15,FontWeight.normal),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                            Container(width: 10)
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SellCategoryScreen(),
                            ));
                        setState(() {
                          categoryModel = result;
                          categoryText.text = categoryModel.catName;
                        });

                        // print('result ${_stateModel.name}');
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Row(
                          children: <Widget>[
                            Text(subcategoryText.text == ''? 'Select Sub Category':subcategoryText.text,style: setStyleContent(context,PsColors.black,15,FontWeight.normal),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                            Container(width: 10)
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                      ),
                      onTap: () async {
                        if(categoryModel == null){
                          context.showErrorBar(content: Text('Select a category to continue'));
                        }else{
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SellSubCategoryScreen(data: categoryModel.id,),
                              ));
                          setState(() {
                            subCategoryModel = result;
                            subcategoryText.text = subCategoryModel.subCatName;
                          });
                        }
                        // print('result ${_stateModel.name}');
                      },
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Photo',style: setStyleContent(context, PsColors.mainColor, 14, FontWeight.w700)),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Text('First Picture is the title picture. you can also add up to five pictures'
                                ,style: setStyleContent(context, Color(0xff6A6B6C), 14, FontWeight.normal)),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            InkWell(
                              child: Image.asset(DrConfig.getImage('imageUpload.png'),height: 40,),
                              onTap: (){
                                loadAssets();
                              },
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            hide == false?
                            Text(''):
                            buildGridView(),
                            SizedBox(height: SizeConfig.screenHeight * 0.01),
                            Text('Supported formats are .jpg, .gif, .png Each picture must not exceed 5 Mb.'
                                ,style: setStyleContent(context, Color(0xff6A6B6C), 14, FontWeight.normal)),
                          ],
                        )
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.01),

                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Row(
                          children: <Widget>[
                            Text(_state.text == ''? 'Select State':_state.text,style: setStyleContent(context,PsColors.black,15,FontWeight.normal),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                            Container(width: 10)
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                      ),
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StateScreen(),
                            ));
                        setState(() {
                          _stateModel = result;
                          _state.text = _stateModel.name;
                          state.text = _stateModel.id;
                          _lga.clear();
                        });

                        // print('result ${_stateModel.name}');
                      },
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Row(
                          children: <Widget>[
                            Text(_lga.text == ''?'Local Government':_lga.text,style: setStyleContent(context,PsColors.black,15,FontWeight.normal),),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                            Container(width: 10)
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                      ),
                      onTap: () async {

                        if(_stateModel == null){
                          context.showErrorBar(content: Text('Select a state to continue'));
                        }else{
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LGAScreen(data:_stateModel.id,),
                              ));
                          setState(() {
                            _lgaModel = result;
                            _lga.text = _lgaModel.name;
                            lga.text = _lgaModel.id;
                          });
                        }

                        // print('result ${_stateModel.name}');
                      },
                    ),



                    SizedBox(height: SizeConfig.screenHeight * 0.02),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        child: Container(
                          height: 52.0,
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: PsColors.mainColor,
                              border: Border.all(color: Colors.white)),
                          child: Center(
                              child: Text("Next",
                                  style: setStyleContent(context, PsColors.white,
                                      14, FontWeight.w700))),
                        ),
                        onTap: () async {

                        },
                      ),
                    ),
                  ]),
            ),
          )
        )
    );

  }
}
