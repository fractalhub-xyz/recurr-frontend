class SyncState {
  final bool connectivity;
  final bool isSyncing;
  final List retry;

  const SyncState({
    this.connectivity = false,
    this.isSyncing = false,
    this.retry = const [],
  });

  SyncState copyWith({
    bool connectivity,
    bool isSyncing,
    List retry,
  }) => SyncState(
      connectivity: connectivity ?? this.connectivity,
      isSyncing: isSyncing ?? this.isSyncing,
      retry: retry ?? this.retry,
  );
}