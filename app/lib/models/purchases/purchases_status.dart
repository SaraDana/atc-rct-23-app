// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Status for a [PurchaseDetails].
///
/// This is the type for [PurchaseDetails.status].
enum PurchaseStatus {
  //initial state
  initial,

  /// The purchase process is pending.
  ///
  /// You can update UI to let your users know the purchase is pending.
  pending,

  /// The purchase is finished and successful.
  ///
  /// Update your UI to indicate the purchase is finished and deliver the product.
  purchased,

  /// Some error occurred in the purchase. The purchasing process if aborted.
  error,

  /// The purchase has been canceled.
  ///
  /// Update your UI to indicate the purchase is canceled.
  canceled,
}
