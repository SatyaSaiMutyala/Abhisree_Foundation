# Razorpay keep rules
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**

# Keep these annotations if referenced
-keep class proguard.annotation.Keep
-keep class proguard.annotation.KeepClassMembers
