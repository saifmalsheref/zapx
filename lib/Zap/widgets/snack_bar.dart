part of 'package:zapx/zapx.dart';

extension CustomSnackBar on _ZapImpl {
  showSnackBar(

      /// content text for the SnackBar
      String contentText,
      {
      /// Duration for the SnackBar, default is [Duration(seconds: 2)]
      Duration? duration,

      /// The radius of the SnackBar's corners, default is [50]
      double radius = 50,

      /// Custom background color for the SnackBar, default is [Colors.black]
      Color backgroundColor = Colors.black,

      /// TextStyle for the content text, default is white text with size 16
      TextStyle? contentTextStyle,

      /// Optional action for the SnackBar
      SnackBarAction? action,

      /// Determines whether to show the close (X) icon, default is [false]
      bool showCloseIcon = false,

      /// Custom text for the close button (if enabled)
      String closeButtonText = 'Close',

      /// TextStyle for the close button text, default is red text
      TextStyle? closeButtonTextStyle,

      /// Padding inside the SnackBar, default is [EdgeInsets.all(5)]
      EdgeInsetsGeometry padding = const EdgeInsets.all(5),

      /// Animation curve for showing the SnackBar, default is [Curves.easeInOut]
      Curve animationCurve = Curves.easeInOut,

      /// Animation duration for the appearance of the SnackBar

      /// Elevation for the SnackBar
      double elevation = 3.0,

      /// Context for the SnackBar show [DEFAULT] is [Zap.context]
      BuildContext? context}) {
    // Creating the SnackBar
    final snackBar = SnackBar(
      // Set the margin for a floating effect
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,

      // Set the padding inside the SnackBar
      padding: padding,

      // Custom shape with a continuous border radius
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),

      // Duration for how long the SnackBar will be shown
      duration: duration ?? const Duration(seconds: 2),

      // Custom background color
      backgroundColor: backgroundColor,

      // SnackBar content (customizable text with styling)
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              contentText,
              style: contentTextStyle ??
                  const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
            ),
          ),
          if (showCloseIcon)
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context ?? Zap.context)
                    .hideCurrentSnackBar();
              },
              child: Text(
                closeButtonText,
                style: closeButtonTextStyle ??
                    const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
        ],
      ),

      // Optional action button
      action: action,

      // Add animation effect

      // Elevation for shadow effect
      elevation: elevation,
    );

    // Show the SnackBar using ScaffoldMessenger
    ScaffoldMessenger.of(context ?? Zap.context).showSnackBar(snackBar);
  }

  showNotificationSnack({
    required Widget title,
    Widget? content,
    Widget? leading,
    bool showDismiss = true,
    NotificationOptions toastOptions = const NotificationOptions(
      borderRadius: 5,
      secondDuration: 4,
    ),
    DismissButton dismissButton = const DismissButton(),
    Function()? onTap,
  }) {
    ShToast.showNotification(
      title: title,
      content: content,
      leading: leading,
      dismissButton: dismissButton,
      onTap: onTap,
      showDismiss: showDismiss,
      toastOptions: toastOptions,
    );
  }

  showToast(
    ///[message] : The message to be displayed in the toast. (Required)
    String message,
{
    ///[toastPostion]: The position where the toast should be shown. (Required)
     ToastPostion toastPostion = ToastPostion.top,

    ///[toastColor] : The background color of the toast. (Default: Colors.black)
    Color toastColor = Colors.black,

    ///[msgStyle] : The text style for the message. (Optional)
    TextStyle? msgStyle,

    ///[borderRadius] : The border radius of the toast. (Default: 10)
    double borderRadius = 10,

    ///[padding] : The padding for the toast. (Default: EdgeInsets.symmetric(horizontal: 5, vertical: 3))
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),

    ///[ToastDuration] The duration for which the toast should be visible. (Default: Duration(seconds: 2))
    Duration toastDuration = const Duration(seconds: 2),

    ///[onTap] : Callback function to be triggered when the toast is tapped. (Optional)
    Function()? onTap,
  }) {
    ShToast.showToast(
      message: message,
      toastPostion: toastPostion,
      ToastColor: toastColor,
      ToastDuration: toastDuration,
      borderRadius:borderRadius,
      msgStyle:msgStyle,
      onTap:onTap,
      padding:padding    
    );
  }
}
