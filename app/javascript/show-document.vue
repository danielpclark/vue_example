<template>
  <div>
    <p>
      <strong>Subject:</strong>
      {{ document.subject }}
    </p>

    <p>
      <strong>Body:</strong>
      {{ document.body }}
    </p>

    <p>
      <strong>State:</strong>
      {{ document.state }}
    </p>
  </div>
</template>

<script lang="coffee">
export default
  props:
    document:
      type: Object
      required: true
</script>
