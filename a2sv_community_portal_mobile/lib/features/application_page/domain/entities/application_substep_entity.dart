class ApplicationSubStepEntity {
  final bool isCompleted;
  final String subStepName;
  final String description;

  ApplicationSubStepEntity({
    required this.isCompleted, 
    required this.subStepName, 
    required this.description,
  }); 
    List<Object?> get props => [isCompleted, subStepName,description];
}